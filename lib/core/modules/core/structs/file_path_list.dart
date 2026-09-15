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

  static final field_count = struct.scalar<int, RUnsignedInt>(.count);
  static final field_paths = struct.pointerAny<RPointer<RChar>>(.paths);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Filepaths entries count
  int get count => field_count.read(getOp());

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