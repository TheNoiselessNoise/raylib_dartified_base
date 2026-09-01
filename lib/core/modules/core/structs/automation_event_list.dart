part of '../../../raylib_dartified_base.dart';

enum AutomationEventListField with StructFields {
  capacity,
  count,
  events,
}

// TODO: translate

/// Automation event list
class AutomationEventListD extends RaylibStructView<AutomationEventListD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<AutomationEventListField> struct = .aligned({
    .capacity: RUnsignedInt(), // Events max entries (MAX_AUTOMATION_EVENTS)
    .count:    RUnsignedInt(), // Events entries count
    .events:   RPointer(RStruct(AutomationEventD.struct)), // Events entries
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<AutomationEventListD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, AutomationEventListD.new, AutomationEventListD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  // NOTE: there's no need for `capacity`
  
  /// Events entries count
  int get count
    => getOp().readUnsignedInt(struct.offset(.count));

  /// Events entries
  List<AutomationEventD> get events => AutomationEventD
    .pointer(getOp().readPtr(struct.offset(.events)))
    .readArray(count);

  AutomationEventListD({ super.op });

  factory AutomationEventListD.zero() => .new();

  @override
  AutomationEventListD clone() => .new(op: getOp());
  
  @override
  String signature() => '$structName(count: $count)';
}
