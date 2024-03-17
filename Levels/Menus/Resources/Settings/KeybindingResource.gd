class_name KeybindingResource
extends Resource

const MOVE_LEFT: String = "move_left"
const MOVE_RIGHT: String = "move_right"
const JUMP: String = "jump"
const ATTACK: String = "attack"
const SHIELD: String = "shield"
const INTERACT: String = "interact"
const TAB_RIGHT: String = "tab_right"
const TAB_LEFT: String = "tab_left"
const SELECT: String = "select"
const PAUSE: String = "pause"
const CANCEL: String = "cancel"
const DPAD: String = "d_pad"

@export var MOVE_LEFT_DEFAULT_KEY = InputEventKey.new()
@export var MOVE_RIGHT_DEFAULT_KEY = InputEventKey.new()
@export var JUMP_DEFAULT_KEY = InputEventKey.new()
@export var ATTACK_DEFAULT_KEY = InputEventKey.new()
@export var SHIELD_DEFAULT_KEY = InputEventKey.new()
@export var INTERACT_DEFAULT_KEY = InputEventKey.new()
@export var TAB_RIGHT_DEFAULT_KEY = InputEventKey.new()
@export var TAB_LEFT_DEFAULT_KEY = InputEventKey.new()
@export var SELECT_DEFAULT_KEY = InputEventKey.new()
@export var PAUSE_DEFAULT_KEY = InputEventKey.new()
@export var CANCEL_DEFAULT_KEY = InputEventKey.new()
@export var DPAD_DEFAULT_KEY = InputEventKey.new()

var move_left_key = InputEventKey.new()
var move_right_key = InputEventKey.new()
var jump_key = InputEventKey.new()
var attack_key = InputEventKey.new() 
var shield_key = InputEventKey.new()
var interact_key = InputEventKey.new()
var tab_right_key = InputEventKey.new()
var tab_left_key = InputEventKey.new()
var select_key = InputEventKey.new()
var pause_key = InputEventKey.new()
var cancel_key = InputEventKey.new()
var dpad_key = InputEventKey.new()
