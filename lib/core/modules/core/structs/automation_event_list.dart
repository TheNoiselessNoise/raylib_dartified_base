part of '../../../raylib_dartified_base.dart';

enum AutomationEventListField with StructFields {
  capacity,
  count,
  events,
}

/// Automation event list
class AutomationEventList extends RaylibStructView<AutomationEventList> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<AutomationEventList> struct = ._builtin(
    factory: AutomationEventList.new,
    layout: .aligned<AutomationEventListField>({
      .capacity: RUnsignedInt(), // Events max entries (MAX_AUTOMATION_EVENTS)
      .count:    RUnsignedInt(), // Events entries count
      .events:   RPointer(RStruct(AutomationEvent.struct)), // Events entries
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<AutomationEventListField> structLayout = struct.layoutOf();

  /// Field descriptor for [capacity].
  static final field_capacity = structLayout.scalar<int, RUnsignedInt>(.capacity);
  /// Field descriptor for [count].
  static final field_count = structLayout.scalar<int, RUnsignedInt>(.count);
  /// Field descriptor for [events].
  static final field_events = structLayout.pointerStructArray<AutomationEvent>(.events);

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
  List<AutomationEvent> get events => field_events.readCount(getOp(), count);

  AutomationEventList({ super.op });

  factory AutomationEventList.zero() => .new();

  @override
  String signature() => '$structName(count: $count)';
}
