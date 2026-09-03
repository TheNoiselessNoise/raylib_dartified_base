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

  @override
  StructLayout<FilePathListField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<FilePathListField> struct = .aligned({
    .count: RUnsignedInt(), // Filepaths entries count
    .paths: RPointer(RPointer(RChar())), // Filepaths entries
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<FilePathListD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, FilePathListD.new, FilePathListD.pointer);

  static final _countF = struct.scalar<int, RUnsignedInt>(.count);
  // NOTE: no direct QoL field for `paths`

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Filepaths entries count
  int get count => _countF.read(getOp().ptr);

  /// Filepaths entries
  List<String> get paths => getOp()
    .readPtr<RPointer<RChar>>(struct.offset(.paths))
    .readStringArray(count);
  
  FilePathListD({ super.op });

  factory FilePathListD.zero() => .new();

  @override
  FilePathListD clone() => .new(op: getOp());

  @override
  String signature() => '$structName(count: $count)';
}