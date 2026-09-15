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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<AutomationEventListD> struct = .new(
    factory: AutomationEventListD.new,
    layout: .aligned<AutomationEventListField>({
      .capacity: RUnsignedInt(), // Events max entries (MAX_AUTOMATION_EVENTS)
      .count:    RUnsignedInt(), // Events entries count
      .events:   RPointer(RStruct(AutomationEventD.struct)), // Events entries
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<AutomationEventListField> structLayout = struct.layoutOf();

  /// Field descriptor for [capacity].
  static final field_capacity = structLayout.scalar<int, RUnsignedInt>(.capacity);
  /// Field descriptor for [count].
  static final field_count = structLayout.scalar<int, RUnsignedInt>(.count);
  /// Field descriptor for [events].
  static final field_events = structLayout.pointerStructArray<AutomationEventD>(.events);

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
  String signature() => '$structName(count: $count)';
}
