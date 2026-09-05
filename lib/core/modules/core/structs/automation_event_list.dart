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
  static StructPointer<AutomationEventListD> pointer(MemoryPointerHandle? ptr)
    => .nullable(ptr, struct, AutomationEventListD.new, AutomationEventListD.pointer);

  static final _capacityF = struct.scalar<int, RUnsignedInt>(.capacity);
  static final _countF = struct.scalar<int, RUnsignedInt>(.count);
  static final _eventsF = struct.pointerStructArray(.events, AutomationEventD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Events max entries (MAX_AUTOMATION_EVENTS)
  int get capacity => _capacityF.read(getOp());
  
  /// Events entries count
  int get count => _countF.read(getOp());

  /// Events entries
  List<AutomationEventD> get events => _eventsF.readCount(getOp(), count);

  AutomationEventListD({ super.op });

  factory AutomationEventListD.zero() => .new();

  @override
  AutomationEventListD clone() => .new(op: getOp());
  
  @override
  String signature() => '$structName(count: $count)';
}
