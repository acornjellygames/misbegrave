extends Node

# ______________________________________________________________________________

var HOLE = EntityPart.new("HOLE", Global.EntityPartType.MISC, preload("res://assets/adornment/hole.png"))

# ______________________________________________________________________________

var BASE_TEST = EntityPart.new("BASE_TEST", Global.EntityPartType.BASE, preload("res://assets/ghost/base/test.png"))
var BASE_COMMON = EntityPart.new("BASE_COMMON", Global.EntityPartType.BASE, preload("res://assets/ghost/base/ghost-base.png"))

# ______________________________________________________________________________

var BOTTOM_TEST = EntityPart.new("BOTTOM_TEST", Global.EntityPartType.BOTTOM, preload("res://assets/ghost/bottom/test.png"))
var BOTTOM_BLOBBY = EntityPart.new("BOTTOM_BLOBBY", Global.EntityPartType.BOTTOM, preload("res://assets/ghost/bottom/bottom-blobby.png"))
var BOTTOM_DRESS = EntityPart.new("BOTTOM_DRESS", Global.EntityPartType.BOTTOM, preload("res://assets/ghost/bottom/bottom-dress.png"))

# ______________________________________________________________________________

var HEAD_TEST = EntityPart.new("HEAD_TEST", Global.EntityPartType.HEAD, preload("res://assets/ghost/head/test.png"))
var HEAD_CURLY = EntityPart.new("HEAD_CURLY", Global.EntityPartType.HEAD, preload("res://assets/ghost/head/curly-hair.png"))
var HEAD_ELVIS = EntityPart.new("HEAD_ELVIS", Global.EntityPartType.HEAD, preload("res://assets/ghost/head/elvis-hair.png"))
var HEAD_SIDEBUN = EntityPart.new("HEAD_SIDEBUN", Global.EntityPartType.HEAD, preload("res://assets/ghost/head/side-bun.png"))
var HEAD_WAVY = EntityPart.new("HEAD_WAVY", Global.EntityPartType.HEAD, preload("res://assets/ghost/head/wavy-hair.png"))

# ______________________________________________________________________________

var FACE_TEST = EntityPart.new("FACE_TEST", Global.EntityPartType.FACE, preload("res://assets/ghost/face/test.png"))
var FACE_ANGY = EntityPart.new("FACE_ANGY", Global.EntityPartType.FACE, preload("res://assets/ghost/face/angy-eyes.png"))
var FACE_DISTRESS = EntityPart.new("FACE_DISTRESS", Global.EntityPartType.FACE, preload("res://assets/ghost/face/distress-eyes.png"))
var FACE_GLASSES = EntityPart.new("FACE_GLASSES", Global.EntityPartType.FACE, preload("res://assets/ghost/face/glasses-eyes.png"))
var FACE_HAPPY = EntityPart.new("FACE_HAPPY", Global.EntityPartType.FACE, preload("res://assets/ghost/face/happy-side-eyes.png"))
var FACE_PRETTY = EntityPart.new("FACE_PRETTY", Global.EntityPartType.FACE, preload("res://assets/ghost/face/pretty-eyes.png"))
var FACE_SPARKLE = EntityPart.new("FACE_SPARKLE", Global.EntityPartType.FACE, preload("res://assets/ghost/face/sparkle-eyes.png"))
