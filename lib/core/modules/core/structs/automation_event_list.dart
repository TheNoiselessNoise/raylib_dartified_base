part of '../../../raylib_dartified_base.dart';

enum AutomationEventListField {
  capacity,
  count,
  events,
}

/// Automation event list
class AutomationEventListD extends RaylibStructView<AutomationEventListD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<AutomationEventListField> structLayout = .aligned(structFields);
  static final Map<AutomationEventListField, RType> structFields = {
    .capacity: RUint32(),
    .count:    RUint32(),
    .events:   RPointer<RStruct>(),
  };

  static StructPointer<AutomationEventListD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, AutomationEventListD.new, AutomationEventListD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Events max entries
  int get capacity
    => getOp().readUint32(structLayout.offset(.capacity));
  
  /// Events entries count
  /// 
  /// Number of recorded events currently stored in [events].
  int get count
    => getOp().readUint32(structLayout.offset(.count));

  /// Events entries
  List<AutomationEventD> get events => AutomationEventD
    .pointer(getOp().readPtr(structLayout.offset(.events)))
    .readArray(count);

  AutomationEventListD({super.op});

  @override
  AutomationEventListD clone() => .new(op: getOp());
  
  @override
  String signature() => '$structName(capacity: $capacity, count: $count)';
}
