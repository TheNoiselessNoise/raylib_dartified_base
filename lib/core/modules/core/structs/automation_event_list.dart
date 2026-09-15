part of '../../../raylib_dartified_base.dart';

enum AutomationEventListField with StructFields {
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

  @override
  StructLayout<AutomationEventListField> get structLayout => struct;

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

  static final field_capacity = struct.scalar<int, RUnsignedInt>(.capacity);
  static final field_count = struct.scalar<int, RUnsignedInt>(.count);
  static final field_events = struct.pointerStructArray(.events, AutomationEventD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Events max entries (MAX_AUTOMATION_EVENTS)
  int get capacity => field_capacity.read(getOp());
  
  /// Events entries count
  int get count => field_count.read(getOp());

  /// Events entries
  List<AutomationEventD> get events => field_events.readCount(getOp(), count);

  AutomationEventListD({ super.op });

  factory AutomationEventListD.zero() => .new();

  @override
  AutomationEventListD clone() => .new(op: getOp());
  
  @override
  String signature() => '$structName(count: $count)';
}
