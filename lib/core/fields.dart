part of 'raylib_dartified_base.dart';



class LivePointerSync<R extends RType> {
  final MemoryPointerHandle? Function() _ptrOf;
  final int _offset;

  LivePointerSync._(
    this._ptrOf,
    this._offset
  );

  MemoryPointer<R> fieldPtr()
    => _ptrOf()?.offsetBy(_offset) ?? MemoryPointer.nullptr();

  MemoryPointer<Y> derefPtr<Y extends RType>()
    => _ptrOf()?.offsetBy(_offset).readPtr() ?? MemoryPointer.nullptr();

  factory LivePointerSync.pointerSync(
    MemoryPointerHandle? Function() ptrOf,
    StructPointerValueField<dynamic, R> field,
  ) => ._(ptrOf, field.offset);

  // we don't care about nullptr
  void syncFrom(MemoryPointerHandle p, {bool borrow = true}) {
    if (!borrow) return;
    fieldPtr().writePtr(p.offsetBy(_offset).readPtr());
  }

  // we don't care about nullptr
  void syncInto(MemoryPointerHandle p)
    => p.offsetBy(_offset).writePtr(derefPtr());
}

extension LivePointerSyncFieldX<E, R extends RType> on StructPointerValueField<E, R> {
  LivePointerSync<R> live(MemoryPointerHandle? Function() ptrOf)
    => .pointerSync(ptrOf, this);
}