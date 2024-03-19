class_name KeybindingResource
extends Resource

const MOVE_FORWARD: String = "move_forward"
const MOVE_BACK: String = "move_back"
const MOVE_LEFT: String = "move_left"
const MOVE_RIGHT: String = "move_right"
const JUMP: String = "jump"
const SPRINT: String = "sprint"
const INVENTORY: String = "inventory"
const PICK_UP: String = "pick_up"
const PAUSE: String = "pause"
const CANCEL: String = "cancel"

@export var MOVE_FORWARD_DEFAULT_KEY = InputEventKey.new()
@export var MOVE_BACK_DEFAULT_KEY = InputEventKey.new()
@export var MOVE_LEFT_DEFAULT_KEY = InputEventKey.new()
@export var MOVE_RIGHT_DEFAULT_KEY = InputEventKey.new()
@export var JUMP_DEFAULT_KEY = InputEventKey.new()
@export var SPRINT_DEFAULT_KEY = InputEventKey.new()
@export var INVENTORY_DEFAULT_KEY = InputEventKey.new()
@export var PICK_UP_DEFAULT_KEY = InputEventKey.new()
@export var PAUSE_DEFAULT_KEY = InputEventKey.new()
@export var CANCEL_DEFAULT_KEY = InputEventKey.new()

var move_forward_key = InputEventKey.new()
var move_back_key = InputEventKey.new()
var move_left_key = InputEventKey.new()
var move_right_key = InputEventKey.new()
var jump_key = InputEventKey.new()
var sprint_key = InputEventKey.new()
var inventory_key = InputEventKey.new()
var pick_up_key = InputEventKey.new()
var pause_key = InputEventKey.new()
var cancel_key = InputEventKey.new()
