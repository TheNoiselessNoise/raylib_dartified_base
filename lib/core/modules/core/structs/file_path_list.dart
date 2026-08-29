part of '../../../raylib_dartified_base.dart';

enum FilePathListField with StructFields {
  count,
  paths,
}

/// File path list
class FilePathListD extends RaylibStructView<FilePathListD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<FilePathListField> structLayout = .aligned({
    .count: RUnsignedInt(), // Filepaths entries count
    .paths: RPointer<RPointer<RChar>>(), // Filepaths entries
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<FilePathListD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, FilePathListD.new, FilePathListD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Filepaths entries count
  int get count => getOp().readUnsignedInt(structLayout.offset(.count));

  /// Filepaths entries
  List<String> get paths => getOp()
    .readPtr<RPointer<RChar>>(structLayout.offset(.paths))
    .readStringArray(count);
  
  FilePathListD({ super.op });

  factory FilePathListD.zero() => .new();

  @override
  FilePathListD clone() => .new(op: getOp());

  @override
  String signature() => '$structName(count: $count)';
}