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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<FilePathListD> struct = .new(
    factory: FilePathListD.new,
    layout: .aligned<FilePathListField>({
      .count: RUnsignedInt(), // Filepaths entries count
      .paths: RPointer(RPointer(RChar())), // Filepaths entries
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<FilePathListField> structLayout = struct.layoutOf();

  /// Field descriptor for [count].
  static final field_count = structLayout.scalar<int, RUnsignedInt>(.count);
  /// Field descriptor for [paths].
  static final field_paths = structLayout.pointerAny<RPointer<RChar>>(.paths);

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
    .readPtr<RPointer<RChar>>(structLayout.offset(.paths))
    .readStringArray(count);
  
  FilePathListD({ super.op });

  factory FilePathListD.zero() => .new();

  @override
  String signature() => '$structName(count: $count)';
}