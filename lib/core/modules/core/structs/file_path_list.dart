part of '../../../raylib_dartified_base.dart';

enum FilePathListField {
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

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<FilePathListField> structLayout = .aligned(structFields);
  static final Map<FilePathListField, RType> structFields = {
    .count: RUint32(),
    .paths: RPointer<RPointer<RChar>>(),
  };

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
  int get count => getOp().readUint32(structLayout.offset(.count));

  /// Filepaths entries
  List<String> get paths => getOp()
    .readPtr<RPointer>(structLayout.offset(.paths))
    .readStringArray(count);
  
  FilePathListD({super.op});

  @override
  FilePathListD clone() => .new(op: getOp());

  @override
  String signature() => '$structName(count: $count)';
}