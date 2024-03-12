//
//  Symbol.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 30/01/24.
//

import UIKit

public extension UIImageView {
  
  func size(_ size: CGFloat, scale: UIImage.SymbolScale = .medium, weight: UIImage.SymbolWeight = .regular) {
    preferredSymbolConfiguration = .init(pointSize: size, weight: weight, scale: scale)
  }
  
  func size(_ font: UIFont) {
    preferredSymbolConfiguration = .init(font: font)
  }
}

// MARK: - Icon

enum Icon {
  
  static var person: UIImage {
    .init(systemName: "person") ?? .add
  }
  
  static var personCircle: UIImage {
    .init(systemName: "person.circle") ?? .add
  }
  
  static var bell: UIImage {
    .init(systemName: "bell") ?? .add
  }
  
  static var star: UIImage {
    .init(systemName: "star") ?? .add
  }
  
  static var share: UIImage {
    .init(systemName: "square.and.arrow.up") ?? .add
  }
  
  static var shareCircle: UIImage {
    .init(systemName: "square.and.arrow.up.circle") ?? .add
  }
  
  static var shareFill: UIImage {
    .init(systemName: "square.and.arrow.up.fill") ?? .add
  }
  
  static var shareCircleFill: UIImage {
    .init(systemName: "square.and.arrow.up.circle.fill") ?? .add
  }
  
  static var pencil: UIImage {
    .init(systemName: "pencil") ?? .add
  }
  
  static var pencilCircle: UIImage {
    .init(systemName: "pencil.circle") ?? .add
  }
  
  static var pencilCircleFill: UIImage {
    .init(systemName: "pencil.circle.fill") ?? .add
  }
  
  static var eraser: UIImage {
    .init(systemName: "eraser") ?? .add
  }
  
  static var eraserFill: UIImage {
    .init(systemName: "eraser.fill") ?? .add
  }
  
  static var squarePencil: UIImage {
    .init(systemName: "square.and.pencil") ?? .add
  }
  
  static var squarePencilCircle: UIImage {
    .init(systemName: "square.and.pencil.circle") ?? .add
  }
  
  static var pencilTip: UIImage {
    .init(systemName: "pencil.tip") ?? .add
  }
  
  static var pencilTipCircle: UIImage {
    .init(systemName: "pencil.tip.crop.circle") ?? .add
  }
  
  static var pencilTipCircleFill: UIImage {
    .init(systemName: "pencil.tip.crop.circle.fill") ?? .add
  }
  
  static var trash: UIImage {
    .init(systemName: "trash") ?? .add
  }
  
  static var trashFill: UIImage {
    .init(systemName: "trash.fill") ?? .add
  }
  
  static var trashCircle: UIImage {
    .init(systemName: "trash.circle") ?? .add
  }
  
  static var trashCircleFill: UIImage {
    .init(systemName: "trash.circle.fill") ?? .add
  }
  
  static var trashSquare: UIImage {
    .init(systemName: "trash.square") ?? .add
  }
  
  static var trashSquareFill: UIImage {
    .init(systemName: "trash.square.fill") ?? .add
  }
  
  static var folder: UIImage {
    .init(systemName: "folder") ?? .add
  }
  
  static var folderFill: UIImage {
    .init(systemName: "folder.fill") ?? .add
  }
  
  static var folderCircle: UIImage {
    .init(systemName: "folder.circle") ?? .add
  }
  
  static var folderCircleFill: UIImage {
    .init(systemName: "folder.circle.fill") ?? .add
  }
  
  static var folderBadge: UIImage {
    .init(systemName: "folder.badge.plus") ?? .add
  }
  
  static var folderBadgeFill: UIImage {
    .init(systemName: "folder.fill.badge.plus") ?? .add
  }
  
  static var folderBadgeMinus: UIImage {
    .init(systemName: "folder.badge.minus") ?? .add
  }
  
  static var folderBadgeMinusFill: UIImage {
    .init(systemName: "folder.fill.badge.minus") ?? .add
  }
  
  static var paperplane: UIImage {
    .init(systemName: "paperplane") ?? .add
  }
  
  static var paperplaneFill: UIImage {
    .init(systemName: "paperplane.fill") ?? .add
  }
  
  static var paperplaneCircle: UIImage {
    .init(systemName: "paperplane.circle") ?? .add
  }
  
  static var paperplaneCircleFill: UIImage {
    .init(systemName: "paperplane.circle.fill") ?? .add
  }
  
  static var doc: UIImage {
    .init(systemName: "doc") ?? .add
  }
  
  static var docFill: UIImage {
    .init(systemName: "doc.fill") ?? .add
  }
  
  static var docCircle: UIImage {
    .init(systemName: "doc.circle") ?? .add
  }
  
  static var docCircleFill: UIImage {
    .init(systemName: "doc.circle.fill") ?? .add
  }
  
  static var docText: UIImage {
    .init(systemName: "doc.text") ?? .add
  }
  
  static var docTextFill: UIImage {
    .init(systemName: "doc.text.fill") ?? .add
  }
  
  static var docOn: UIImage {
    .init(systemName: "doc.on.doc") ?? .add
  }
  
  static var docOnFill: UIImage {
    .init(systemName: "doc.on.doc.fill") ?? .add
  }
  
  static var clipboard: UIImage {
    .init(systemName: "clipboard") ?? .add
  }
  
  static var clipboardFill: UIImage {
    .init(systemName: "clipboard.fill") ?? .add
  }
  
  static var listBulletClipboard: UIImage {
    .init(systemName: "list.bullet.clipboard") ?? .add
  }
  
  static var listBulletClipboardFill: UIImage {
    .init(systemName: "list.bullet.clipboard.fill") ?? .add
  }
  
  static var docPlainText: UIImage {
    .init(systemName: "doc.plaintext") ?? .add
  }
  
  static var docPlainTextFill: UIImage {
    .init(systemName: "doc.plaintext.fill") ?? .add
  }
  static var note: UIImage {
    .init(systemName: "note") ?? .add
  }
  
  static var noteText: UIImage {
    .init(systemName: "note.text") ?? .add
  }
  
  static var calendar: UIImage {
    .init(systemName: "calendar") ?? .add
  }
  
  static var calendarCircle: UIImage {
    .init(systemName: "calendar.circle") ?? .add
  }
  
  static var calendarClock: UIImage {
    .init(systemName: "calendar.badge.clock") ?? .add
  }
  
  static var book: UIImage {
    .init(systemName: "book") ?? .add
  }
  
  static var bookCircle: UIImage {
    .init(systemName: "book.circle") ?? .add
  }
  static var bookCircleFill: UIImage {
    .init(systemName: "book.circle.fill") ?? .add
  }
  
  static var bookFill: UIImage {
    .init(systemName: "book.fill") ?? .add
  }
  
  static var booksVertical: UIImage {
    .init(systemName: "books.vertical") ?? .add
  }
  
  static var booksVerticalFill: UIImage {
    .init(systemName: "books.vertical.fill") ?? .add
  }
  
  static var booksVerticalCircle: UIImage {
    .init(systemName: "books.vertical.circle") ?? .add
  }
  
  static var booksVerticalCircleFill: UIImage {
    .init(systemName: "books.vertical.circle.fill") ?? .add
  }
  
  static var bookmark: UIImage {
    .init(systemName: "bookmark") ?? .add
  }
  
  static var bookmarkFill: UIImage {
    .init(systemName: "bookmark.fill") ?? .add
  }
  static var bookmarkCircle: UIImage {
    .init(systemName: "bookmark.circle") ?? .add
  }
  
  static var bookmarkCircleFill: UIImage {
    .init(systemName: "bookmark.circle.fill") ?? .add
  }
  
  static var bookmarkSquare: UIImage {
    .init(systemName: "bookmark.square") ?? .add
  }
  
  static var bookmarkSquareFill: UIImage {
    .init(systemName: "bookmark.square.fill") ?? .add
  }
  
  static var ruler: UIImage {
    .init(systemName: "ruler") ?? .add
  }
  
  static var rulerFill: UIImage {
    .init(systemName: "ruler.fill") ?? .add
  }
  
  static var pencilAndRuler: UIImage {
    .init(systemName: "pencil.and.ruler") ?? .add
  }
  
  static var pencilAndRulerFill: UIImage {
    .init(systemName: "pencil.and.ruler.fill") ?? .add
  }
  static var backpack: UIImage {
    .init(systemName: "backpack") ?? .add
  }
  
  static var backpackFill: UIImage {
    .init(systemName: "backpack.fill") ?? .add
  }
  
  static var backpackCircle: UIImage {
    .init(systemName: "backpack.circle") ?? .add
  }
  
  static var backpackCircleFill: UIImage {
    .init(systemName: "backpack.circle.fill") ?? .add
  }
  
  static var paperclip: UIImage {
    .init(systemName: "paperclip") ?? .add
  }
  
  static var paperclipCircle: UIImage {
    .init(systemName: "paperclip.circle") ?? .add
  }
  
  static var paperclipCircleFill: UIImage {
    .init(systemName: "paperclip.circle.fill") ?? .add
  }
  
  static var link: UIImage {
    .init(systemName: "link") ?? .add
  }
  static var linkCircle: UIImage {
    .init(systemName: "link.circle") ?? .add
  }
  
  static var linkCircleFill: UIImage {
    .init(systemName: "link.circle.fill") ?? .add
  }
  
  static var personalHotspot: UIImage {
    .init(systemName: "personalhotspot") ?? .add
  }
  
  static var personalHotspotCircle: UIImage {
    .init(systemName: "personalhotspot.circle") ?? .add
  }
  
  static var personalHotspotCircleFill: UIImage {
    .init(systemName: "personalhotspot.circle.fill") ?? .add
  }
  
  static var personCircleFill: UIImage {
    .init(systemName: "person.circle.fill") ?? .add
  }
  
  static var personFill: UIImage {
    .init(systemName: "person.fill") ?? .add
  }
  
  static var shareplay: UIImage {
    .init(systemName: "shareplay") ?? .add
  }
  
  static var person2: UIImage {
    .init(systemName: "person.2") ?? .add
  }
  
  static var person2Fill: UIImage {
    .init(systemName: "person.2.fill") ?? .add
  }
  static var person2Circle: UIImage {
    .init(systemName: "person.2.circle") ?? .add
  }
  
  static var person2CircleFill: UIImage {
    .init(systemName: "person.2.circle.fill") ?? .add
  }
  
  static var person3: UIImage {
    .init(systemName: "person.3") ?? .add
  }
  
  static var person3Fill: UIImage {
    .init(systemName: "person.3.fill") ?? .add
  }
  
  static var personCropCircle: UIImage {
    .init(systemName: "person.crop.circle") ?? .add
  }
  
  static var personCropCircleFill: UIImage {
    .init(systemName: "person.crop.circle.fill") ?? .add
  }
  
  static var personCropSquare: UIImage {
    .init(systemName: "person.crop.square") ?? .add
  }
  
  static var personCropSquareFill: UIImage {
    .init(systemName: "person.crop.square.fill") ?? .add
  }
  static var globe: UIImage {
    .init(systemName: "globe") ?? .add
  }
  
  static var network: UIImage {
    .init(systemName: "network") ?? .add
  }
  
  static var sunMin: UIImage {
    .init(systemName: "sun.min") ?? .add
  }
  
  static var sunMinFill: UIImage {
    .init(systemName: "sun.min.fill") ?? .add
  }
  
  static var sunMax: UIImage {
    .init(systemName: "sun.max") ?? .add
  }
  
  static var sunMaxFill: UIImage {
    .init(systemName: "sun.max.fill") ?? .add
  }
  
  static var cloud: UIImage {
    .init(systemName: "cloud") ?? .add
  }
  
  static var cloudFill: UIImage {
    .init(systemName: "cloud.fill") ?? .add
  }
  static var cloudRain: UIImage {
    .init(systemName: "cloud.rain") ?? .add
  }
  
  static var cloudRainFill: UIImage {
    .init(systemName: "cloud.rain.fill") ?? .add
  }
  
  static var cloudBoltRain: UIImage {
    .init(systemName: "cloud.bolt.rain") ?? .add
  }
  
  static var cloudBoltRainFill: UIImage {
    .init(systemName: "cloud.bolt.rain.fill") ?? .add
  }
  
  static var cloudSun: UIImage {
    .init(systemName: "cloud.sun") ?? .add
  }
  
  static var cloudSunFill: UIImage {
    .init(systemName: "cloud.sun.fill") ?? .add
  }
  
  static var drop: UIImage {
    .init(systemName: "drop") ?? .add
  }
  
  static var dropFill: UIImage {
    .init(systemName: "drop.fill") ?? .add
  }
  static var play: UIImage {
    .init(systemName: "play") ?? .add
  }
  
  static var playFill: UIImage {
    .init(systemName: "play.fill") ?? .add
  }
  
  static var playCircle: UIImage {
    .init(systemName: "play.circle") ?? .add
  }
  
  static var playCircleFill: UIImage {
    .init(systemName: "play.circle.fill") ?? .add
  }
  
  static var playSquare: UIImage {
    .init(systemName: "play.square") ?? .add
  }
  
  static var playSquareFill: UIImage {
    .init(systemName: "play.square.fill") ?? .add
  }
  
  static var playRectangle: UIImage {
    .init(systemName: "play.rectangle") ?? .add
  }
  
  static var playRectangleFill: UIImage {
    .init(systemName: "play.rectangle.fill") ?? .add
  }
  
  static var pause: UIImage {
    .init(systemName: "pause") ?? .add
  }
  
  static var pauseFill: UIImage {
    .init(systemName: "pause.fill") ?? .add
  }
  
  static var pauseCircle: UIImage {
    .init(systemName: "pause.circle") ?? .add
  }
  
  static var pauseCircleFill: UIImage {
    .init(systemName: "pause.circle.fill") ?? .add
  }
  
  static var pauseRectangle: UIImage {
    .init(systemName: "pause.rectangle") ?? .add
  }
  
  static var pauseRectangleFill: UIImage {
    .init(systemName: "pause.rectangle.fill") ?? .add
  }
  
  static var stop: UIImage {
    .init(systemName: "stop") ?? .add
  }
  static var stopFill: UIImage {
    .init(systemName: "stop.fill") ?? .add
  }
  
  static var stopCircle: UIImage {
    .init(systemName: "stop.circle") ?? .add
  }
  
  static var stopCircleFill: UIImage {
    .init(systemName: "stop.circle.fill") ?? .add
  }
  
  static var recordCircle: UIImage {
    .init(systemName: "record.circle") ?? .add
  }
  
  static var recordCircleFill: UIImage {
    .init(systemName: "record.circle.fill") ?? .add
  }
  
  static var playPause: UIImage {
    .init(systemName: "playpause") ?? .add
  }
  
  static var playPauseFill: UIImage {
    .init(systemName: "playpause.fill") ?? .add
  }
  
  static var playPauseCircle: UIImage {
    .init(systemName: "playpause.circle") ?? .add
  }
  static var playPauseCircleFill: UIImage {
    .init(systemName: "playpause.circle.fill") ?? .add
  }
  
  static var backward: UIImage {
    .init(systemName: "backward") ?? .add
  }
  
  static var backwardFill: UIImage {
    .init(systemName: "backward.fill") ?? .add
  }
  
  static var backwardCircle: UIImage {
    .init(systemName: "backward.circle") ?? .add
  }
  
  static var backwardCircleFill: UIImage {
    .init(systemName: "backward.circle.fill") ?? .add
  }
  
  static var forward: UIImage {
    .init(systemName: "forward") ?? .add
  }
  
  static var forwardFill: UIImage {
    .init(systemName: "forward.fill") ?? .add
  }
  
  static var forwardCircle: UIImage {
    .init(systemName: "forward.circle") ?? .add
  }
  static var forwardCircleFill: UIImage {
    .init(systemName: "forward.circle.fill") ?? .add
  }
  
  static var backwardEnd: UIImage {
    .init(systemName: "backward.end") ?? .add
  }
  
  static var backwardEndFill: UIImage {
    .init(systemName: "backward.end.fill") ?? .add
  }
  
  static var forwardEnd: UIImage {
    .init(systemName: "forward.end") ?? .add
  }
  
  static var forwardEndFill: UIImage {
    .init(systemName: "forward.end.fill") ?? .add
  }
  
  static var infinity: UIImage {
    .init(systemName: "infinity") ?? .add
  }
  
  static var infinityCircle: UIImage {
    .init(systemName: "infinity.circle") ?? .add
  }
  
  static var sos: UIImage {
    .init(systemName: "SOS") ?? .add
  }
  static var sosCircle: UIImage {
    .init(systemName: "sos.circle") ?? .add
  }
  
  static var sosCircleFill: UIImage {
    .init(systemName: "sos.circle.fill") ?? .add
  }
  
  static var speaker: UIImage {
    .init(systemName: "speaker") ?? .add
  }
  
  static var speakerFill: UIImage {
    .init(systemName: "speaker.fill") ?? .add
  }
  
  static var speakerSquare: UIImage {
    .init(systemName: "speaker.square") ?? .add
  }
  
  static var speakerSquareFill: UIImage {
    .init(systemName: "speaker.square.fill") ?? .add
  }
  
  static var speakerPlus: UIImage {
    .init(systemName: "speaker.plus") ?? .add
  }
  
  static var speakerPlusFill: UIImage {
    .init(systemName: "speaker.plus.fill") ?? .add
  }
  static var speakerMinus: UIImage {
    .init(systemName: "speaker.minus") ?? .add
  }
  
  static var speakerMinusFill: UIImage {
    .init(systemName: "speaker.minus.Fill") ?? .add
  }
  
  static var speakerWave3: UIImage {
    .init(systemName: "speaker.wave.3") ?? .add
  }
  
  static var speakerWave3Fill: UIImage {
    .init(systemName: "speaker.wave.3.fill") ?? .add
  }
  
  static var musicNote: UIImage {
    .init(systemName: "music.note") ?? .add
  }
  
  static var musicNoteList: UIImage {
    .init(systemName: "music.note.list") ?? .add
  }
  
  static var musicMic: UIImage {
    .init(systemName: "music.mic") ?? .add
  }
  
  static var musicMicCircle: UIImage {
    .init(systemName: "music.mic.circle") ?? .add
  }
  
  static var musicMicCircleFill: UIImage {
    .init(systemName: "music.mic.circle.fill") ?? .add
  }
  
  static var goForward5: UIImage {
    .init(systemName: "goforward.5") ?? .add
  }
  
  static var goForward10: UIImage {
    .init(systemName: "goforward.10") ?? .add
  }
  
  static var goForward15: UIImage {
    .init(systemName: "goforward.15") ?? .add
  }
  
  static var goForward30: UIImage {
    .init(systemName: "goforward.30") ?? .add
  }
  
  static var goForward45: UIImage {
    .init(systemName: "goforward.45") ?? .add
  }
  
  static var goForward60: UIImage {
    .init(systemName: "goforward.60") ?? .add
  }
  
  static var gobackward5: UIImage {
    .init(systemName: "gobackward.5") ?? .add
  }
  
  static var gobackward10: UIImage {
    .init(systemName: "gobackward.10") ?? .add
  }
  static var gobackward15: UIImage {
    .init(systemName: "gobackward.15") ?? .add
  }
  
  static var gobackward30: UIImage {
    .init(systemName: "gobackward.30") ?? .add
  }
  
  static var gobackward45: UIImage {
    .init(systemName: "gobackward.45") ?? .add
  }
  
  static var gobackward60: UIImage {
    .init(systemName: "gobackward.60") ?? .add
  }
  
  static var swift: UIImage {
    .init(systemName: "swift") ?? .add
  }
  
  static var swiftData: UIImage {
    .init(systemName: "swiftdata") ?? .add
  }
  
  static var magnifyingGlass: UIImage {
    .init(systemName: "magnifyingglass") ?? .add
  }
  
  static var magnifyingGlassCircle: UIImage {
    .init(systemName: "magnifyingglass.circle") ?? .add
  }
  static var magnifyingGlassCircleFill: UIImage {
    .init(systemName: "magnifyingglass.circle.fill") ?? .add
  }
  
  static var mic: UIImage {
    .init(systemName: "mic") ?? .add
  }
  
  static var micFill: UIImage {
    .init(systemName: "mic.fill") ?? .add
  }
  
  static var micCircle: UIImage {
    .init(systemName: "mic.circle") ?? .add
  }
  
  static var micCircleFill: UIImage {
    .init(systemName: "mic.circle.fill") ?? .add
  }
  
  static var micSquare: UIImage {
    .init(systemName: "mic.square") ?? .add
  }
  
  static var micSquareFill: UIImage {
    .init(systemName: "mic.square.fill") ?? .add
  }
  
  static var micSlash: UIImage {
    .init(systemName: "mic.slash") ?? .add
  }
  
  static var micSlashFill: UIImage {
    .init(systemName: "mic.slash.fill") ?? .add
  }
  
  static var micSlashCircle: UIImage {
    .init(systemName: "mic.slash.circle") ?? .add
  }
  
  static var micSlashCircleFill: UIImage {
    .init(systemName: "mic.slash.circle.fill") ?? .add
  }
  
  static var square: UIImage {
    .init(systemName: "square") ?? .add
  }
  
  static var squareFill: UIImage {
    .init(systemName: "square.fill") ?? .add
  }
  
  static var squareStack: UIImage {
    .init(systemName: "square.stack") ?? .add
  }
  static var squareStackFill: UIImage {
    .init(systemName: "square.stack.fill") ?? .add
  }
  
  static var capsule: UIImage {
    .init(systemName: "capsule") ?? .add
  }
  
  static var capsuleFill: UIImage {
    .init(systemName: "capsule.fill") ?? .add
  }
  
  static var triangle: UIImage {
    .init(systemName: "triangle") ?? .add
  }
  
  static var triangleFill: UIImage {
    .init(systemName: "triangle.fill") ?? .add
  }
  
  static var diamond: UIImage {
    .init(systemName: "diamond") ?? .add
  }
  
  static var diamondFill: UIImage {
    .init(systemName: "diamond.fill") ?? .add
  }
  
  static var hexagon: UIImage {
    .init(systemName: "hexagon") ?? .add
  }
  
  static var hexagonFill: UIImage {
    .init(systemName: "hexagon.fill") ?? .add
  }
  
  static var pentagon: UIImage {
    .init(systemName: "pentagon") ?? .add
  }
  
  static var pentagonFill: UIImage {
    .init(systemName: "pentagon.fill") ?? .add
  }
  
  static var seal: UIImage {
    .init(systemName: "seal") ?? .add
  }
  
  static var sealFill: UIImage {
    .init(systemName: "seal.fill") ?? .add
  }
  
  static var checkmarkSeal: UIImage {
    .init(systemName: "checkmark.seal") ?? .add
  }
  
  static var checkmarkSealFill: UIImage {
    .init(systemName: "checkmark.seal.fill") ?? .add
  }
  
  static var xmarkSeal: UIImage {
    .init(systemName: "xmark.seal") ?? .add
  }
  
  static var xmarkSealFill: UIImage {
    .init(systemName: "xmark.seal.fill") ?? .add
  }
  
  static var heart: UIImage {
    .init(systemName: "heart") ?? .add
  }
  
  static var heartFill: UIImage {
    .init(systemName: "heart.fill") ?? .add
  }
  
  static var heartCircle: UIImage {
    .init(systemName: "heart.circle") ?? .add
  }
  
  static var heartCircleFill: UIImage {
    .init(systemName: "heart.circle.fill") ?? .add
  }
  
  static var heartSquare: UIImage {
    .init(systemName: "heart.square") ?? .add
  }
  
  static var heartSquareFill: UIImage {
    .init(systemName: "heart.square.fill") ?? .add
  }
  
  static var starFill: UIImage {
    .init(systemName: "star.fill") ?? .add
  }
  
  static var starCircle: UIImage {
    .init(systemName: "star.circle") ?? .add
  }
  
  static var starCircleFill: UIImage {
    .init(systemName: "star.circle.fill") ?? .add
  }
  
  static var shield: UIImage {
    .init(systemName: "shield") ?? .add
  }
  
  static var shieldFill: UIImage {
    .init(systemName: "shield.fill") ?? .add
  }
  
  static var flag: UIImage {
    .init(systemName: "flag") ?? .add
  }
  static var flagFill: UIImage {
    .init(systemName: "flag.fill") ?? .add
  }
  
  static var flagCircle: UIImage {
    .init(systemName: "flag.circle") ?? .add
  }
  
  static var flagCircleFill: UIImage {
    .init(systemName: "flag.circle.fill") ?? .add
  }
  
  static var location: UIImage {
    .init(systemName: "location") ?? .add
  }
  
  static var locationFill: UIImage {
    .init(systemName: "location.fill") ?? .add
  }
  
  static var locationCircle: UIImage {
    .init(systemName: "location.circle") ?? .add
  }
  
  static var locationCircleFill: UIImage {
    .init(systemName: "location.circle.fill") ?? .add
  }
  
  static var locationSquare: UIImage {
    .init(systemName: "location.square") ?? .add
  }
  
  static var locationSquareFill: UIImage {
    .init(systemName: "location.square.fill") ?? .add
  }
  
  static var bellFill: UIImage {
    .init(systemName: "bell.fill") ?? .add
  }
  
  static var bellCircle: UIImage {
    .init(systemName: "bell.circle") ?? .add
  }
  
  static var bellCircleFill: UIImage {
    .init(systemName: "bell.circle.fill") ?? .add
  }
  
  static var bellSquare: UIImage {
    .init(systemName: "bell.square") ?? .add
  }
  
  static var bellSquareFill: UIImage {
    .init(systemName: "bell.square.fill") ?? .add
  }
  
  static var bellBadge: UIImage {
    .init(systemName: "bell.badge") ?? .add
  }
  
  static var bellBadgeFill: UIImage {
    .init(systemName: "bell.badge.fill") ?? .add
  }
  
  static var bellBadgeCircle: UIImage {
    .init(systemName: "bell.badge.circle") ?? .add
  }
  
  static var bellBadgeCircleFill: UIImage {
    .init(systemName: "bell.badge.circle.fill") ?? .add
  }
  
  static var tag: UIImage {
    .init(systemName: "tag") ?? .add
  }
  
  static var tagFill: UIImage {
    .init(systemName: "tag.fill") ?? .add
  }
  
  static var tagCircle: UIImage {
    .init(systemName: "tag.circle") ?? .add
  }
  
  static var tagCircleFill: UIImage {
    .init(systemName: "tag.circle.fill") ?? .add
  }
  
  static var tagSquare: UIImage {
    .init(systemName: "tag.square") ?? .add
  }
  
  static var tagSquareFill: UIImage {
    .init(systemName: "tag.square.fill") ?? .add
  }
  
  static var icloud: UIImage {
    .init(systemName: "icloud") ?? .add
  }
  
  static var icloudFill: UIImage {
    .init(systemName: "icloud.fill") ?? .add
  }
  
  static var icloudCircle: UIImage {
    .init(systemName: "icloud.circle") ?? .add
  }
  
  static var icloudCircleFill: UIImage {
    .init(systemName: "icloud.circle.fill") ?? .add
  }
  
  static var arrowClockwiseIcloud: UIImage {
    .init(systemName: "arrow.clockwise.icloud") ?? .add
  }
  
  static var arrowClockwiseIcloudFill: UIImage {
    .init(systemName: "arrow.clockwise.icloud.fill") ?? .add
  }
  
  static var flashlightOffFill: UIImage {
    .init(systemName: "flashlight.off.fill") ?? .add
  }
  
  static var flashlightOnFill: UIImage {
    .init(systemName: "flashlight.on.fill") ?? .add
  }
  
  static var camera: UIImage {
    .init(systemName: "camera") ?? .add
  }
  
  static var cameraFill: UIImage {
    .init(systemName: "camera.fill") ?? .add
  }
  
  static var cameraCircle: UIImage {
    .init(systemName: "camera.circle") ?? .add
  }
  
  static var cameraCircleFill: UIImage {
    .init(systemName: "camera.circle.fill") ?? .add
  }
  
  static var message: UIImage {
    .init(systemName: "message") ?? .add
  }
  
  static var messageFill: UIImage {
    .init(systemName: "message.fill") ?? .add
  }
  
  static var messageCircle: UIImage {
    .init(systemName: "message.circle") ?? .add
  }
  
  static var messageCircleFill: UIImage {
    .init(systemName: "message.circle.fill") ?? .add
  }
  
  static var phone: UIImage {
    .init(systemName: "phone") ?? .add
  }
  
  static var phoneFill: UIImage {
    .init(systemName: "phone.fill") ?? .add
  }
  
  static var phoneCircle: UIImage {
    .init(systemName: "phone.circle") ?? .add
  }
  
  static var phoneCircleFill: UIImage {
    .init(systemName: "phone.circle.fill") ?? .add
  }
  
  static var video: UIImage {
    .init(systemName: "video") ?? .add
  }
  
  static var videoFill: UIImage {
    .init(systemName: "video.fill") ?? .add
  }
  
  static var videoCircle: UIImage {
    .init(systemName: "video.circle") ?? .add
  }
  
  static var videoCircleFill: UIImage {
    .init(systemName: "video.circle.fill") ?? .add
  }
  
  static var videoSquare: UIImage {
    .init(systemName: "video.square") ?? .add
  }
  
  static var videoSquareFill: UIImage {
    .init(systemName: "video.square.fill") ?? .add
  }
  
  static var envelope: UIImage {
    .init(systemName: "envelope") ?? .add
  }
  
  static var envelopeFill: UIImage {
    .init(systemName: "envelope.fill") ?? .add
  }
  
  static var gear: UIImage {
    .init(systemName: "gear") ?? .add
  }
  
  static var gearCircle: UIImage {
    .init(systemName: "gear.circle") ?? .add
  }
  
  static var gearCircleFill: UIImage {
    .init(systemName: "gear.circle.fill") ?? .add
  }
  
  static var ellipsis: UIImage {
    .init(systemName: "ellipsis") ?? .add
  }
  
  static var ellipsisCircle: UIImage {
    .init(systemName: "ellipsis.circle") ?? .add
  }
  
  static var ellipsisCircleFill: UIImage {
    .init(systemName: "ellipsis.circle.fill") ?? .add
  }
  
  static var bag: UIImage {
    .init(systemName: "bag") ?? .add
  }
  
  static var bagFill: UIImage {
    .init(systemName: "bag.fill") ?? .add
  }
  
  static var bagCircle: UIImage {
    .init(systemName: "bag.circle") ?? .add
  }
  
  static var bagCircleFill: UIImage {
    .init(systemName: "bag.circle.fill") ?? .add
  }
  
  static var cart: UIImage {
    .init(systemName: "cart") ?? .add
  }
  
  static var cartFill: UIImage {
    .init(systemName: "cart.fill") ?? .add
  }
  
  static var creditcard: UIImage {
    .init(systemName: "creditcard") ?? .add
  }
  static var creditCardFill: UIImage {
    .init(systemName: "creditcard.fill") ?? .add
  }
  
  static var giftCard: UIImage {
    .init(systemName: "giftcard") ?? .add
  }
  
  static var giftCardFill: UIImage {
    .init(systemName: "giftcard.fill") ?? .add
  }
  
  static var printer: UIImage {
    .init(systemName: "printer") ?? .add
  }
  
  static var printerFill: UIImage {
    .init(systemName: "printer.fill") ?? .add
  }
  
  static var house: UIImage {
    .init(systemName: "house") ?? .add
  }
  
  static var houseFill: UIImage {
    .init(systemName: "house.fill") ?? .add
  }
  
  static var houseCircle: UIImage {
    .init(systemName: "house.circle") ?? .add
  }
  
  static var houseCircleFill: UIImage {
    .init(systemName: "house.circle.fill") ?? .add
  }
  
  static var lightbulb: UIImage {
    .init(systemName: "lightbulb") ?? .add
  }
  
  static var lightbulbFill: UIImage {
    .init(systemName: "lightbulb.fill") ?? .add
  }
  
  static var lightbulbMax: UIImage {
    .init(systemName: "lightbulb.max") ?? .add
  }
  
  static var lightbulbMaxFill: UIImage {
    .init(systemName: "lightbulb.max.fill") ?? .add
  }
  
  static var lock: UIImage {
    .init(systemName: "lock") ?? .add
  }
  
  static var lockFill: UIImage {
    .init(systemName: "lock.fill") ?? .add
  }
  
  static var lockRotation: UIImage {
    .init(systemName: "lock.rotation") ?? .add
  }
  
  static var lockOpenRotation: UIImage {
    .init(systemName: "lock.open.rotation") ?? .add
  }
  
  static var wifi: UIImage {
    .init(systemName: "wifi") ?? .add
  }
  
  static var wifiCircle: UIImage {
    .init(systemName: "wifi.circle") ?? .add
  }
  
  static var wifiCircleFill: UIImage {
    .init(systemName: "wifi.circle.fill") ?? .add
  }
  
  static var wifiSquare: UIImage {
    .init(systemName: "wifi.square") ?? .add
  }
  
  static var wifiSquareFill: UIImage {
    .init(systemName: "wifi.square.fill") ?? .add
  }
  
  static var pin: UIImage {
    .init(systemName: "pin") ?? .add
  }
  
  static var pinFill: UIImage {
    .init(systemName: "pin.fill") ?? .add
  }
  
  static var pinCircle: UIImage {
    .init(systemName: "pin.circle") ?? .add
  }
  
  static var pinCircleFill: UIImage {
    .init(systemName: "pin.circle.fill") ?? .add
  }
  
  static var pinSquare: UIImage {
    .init(systemName: "pin.square") ?? .add
  }
  
  static var pinSquareFill: UIImage {
    .init(systemName: "pin.square.fill") ?? .add
  }
  
  static var mappin: UIImage {
    .init(systemName: "mappin") ?? .add
  }
  
  static var mappinCircle: UIImage {
    .init(systemName: "mappin.circle") ?? .add
  }
  
  static var mappinCircleFill: UIImage {
    .init(systemName: "mappin.circle.fill") ?? .add
  }
  
  static var mappinAndEllipseCircle: UIImage {
    .init(systemName: "mappin.and.ellipse.circle") ?? .add
  }
  
  static var mappinAndEllipseCircleFill: UIImage {
    .init(systemName: "mappin.and.ellipse.circle.fill") ?? .add
  }
  
  static var map: UIImage {
    .init(systemName: "map") ?? .add
  }
  
  static var mapFill: UIImage {
    .init(systemName: "map.fill") ?? .add
  }
  
  static var mapCircle: UIImage {
    .init(systemName: "map.circle") ?? .add
  }
  
  static var mapCircleFill: UIImage {
    .init(systemName: "map.circle.fill") ?? .add
  }
  
  static var safari: UIImage {
    .init(systemName: "safari") ?? .add
  }
  
  static var safariFill: UIImage {
    .init(systemName: "safari.fill") ?? .add
  }
  
  static var rotateLeft: UIImage {
    .init(systemName: "rotate.left") ?? .add
  }
  
  static var rotateLeftFill: UIImage {
    .init(systemName: "rotate.left.fill") ?? .add
  }
  
  static var rotateRight: UIImage {
    .init(systemName: "rotate.right") ?? .add
  }
  
  static var rotateRightFill: UIImage {
    .init(systemName: "rotate.right.fill") ?? .add
  }
  static var faceid: UIImage {
    .init(systemName: "faceid") ?? .add
  }
  
  static var display: UIImage {
    .init(systemName: "display") ?? .add
  }
  
  static var laptopcomputer: UIImage {
    .init(systemName: "laptopcomputer") ?? .add
  }
  
  static var iphone: UIImage {
    .init(systemName: "iphone") ?? .add
  }
  
  static var ipad: UIImage {
    .init(systemName: "ipad") ?? .add
  }
  
  static var visionpro: UIImage {
    .init(systemName: "visionpro") ?? .add
  }
  
  static var applewatch: UIImage {
    .init(systemName: "applewatch") ?? .add
  }
  
  static var headphones: UIImage {
    .init(systemName: "headphones") ?? .add
  }
  static var qrcodeViewFinder: UIImage {
    .init(systemName: "qrcode.viewfinder") ?? .add
  }
  
  static var barcodeViewFinder: UIImage {
    .init(systemName: "barcode.viewfinder") ?? .add
  }
  
  static var cameraViewFinder: UIImage {
    .init(systemName: "camera.viewfinder") ?? .add
  }
  
  static var locationViewFinder: UIImage {
    .init(systemName: "location.viewfinder") ?? .add
  }
  
  static var locationFillViewFinder: UIImage {
    .init(systemName: "location.fill.viewfinder") ?? .add
  }
  
  static var docViewFinder: UIImage {
    .init(systemName: "doc.viewfinder") ?? .add
  }
  
  static var photo: UIImage {
    .init(systemName: "photo") ?? .add
  }
  
  static var photoFill: UIImage {
    .init(systemName: "photo.fill") ?? .add
  }
  
  static var photoCircle: UIImage {
    .init(systemName: "photo.circle") ?? .add
  }
  
  static var photoCircleFill: UIImage {
    .init(systemName: "photo.circle.fill") ?? .add
  }
  
  static var clock: UIImage {
    .init(systemName: "clock") ?? .add
  }
  
  static var clockFill: UIImage {
    .init(systemName: "clock.fill") ?? .add
  }
  
  static var stopwatch: UIImage {
    .init(systemName: "stopwatch") ?? .add
  }
  
  static var stopwatchFill: UIImage {
    .init(systemName: "stopwatch.fill") ?? .add
  }
  
  static var arrowCirclePath: UIImage {
    .init(systemName: "arrow.circlepath") ?? .add
  }
  
  static var cylinder: UIImage {
    .init(systemName: "cylinder") ?? .add
  }
  
  static var cylinderFill: UIImage {
    .init(systemName: "cylinder.fill") ?? .add
  }
  
  static var cellularbars: UIImage {
    .init(systemName: "cellularbars") ?? .add
  }
  
  static var chartPie: UIImage {
    .init(systemName: "chart.pie") ?? .add
  }
  
  static var chartPieFill: UIImage {
    .init(systemName: "chart.pie.fill") ?? .add
  }
  
  static var waveformPath: UIImage {
    .init(systemName: "waveform.path") ?? .add
  }
  
  static var waveformCircle: UIImage {
    .init(systemName: "waveform.circle") ?? .add
  }
  
  static var waveformCircleFill: UIImage {
    .init(systemName: "waveform.circle.fill") ?? .add
  }
  
  static var touchid: UIImage {
    .init(systemName: "touchid") ?? .add
  }
  
  static var atom: UIImage {
    .init(systemName: "atom") ?? .add
  }
  
  static var angle: UIImage {
    .init(systemName: "angle") ?? .add
  }
  
  static var chartxyaxisLine: UIImage {
    .init(systemName: "chart.xyaxis.line") ?? .add
  }
  
  static var chartLineUptrendxyaxis: UIImage {
    .init(systemName: "chart.line.uptrend.xyaxis") ?? .add
  }
  
  static var chartLineDowntrendxyaxis: UIImage {
    .init(systemName: "chart.line.downtrend.xyaxis") ?? .add
  }
  
  static var gift: UIImage {
    .init(systemName: "gift") ?? .add
  }
  
  static var giftFill: UIImage {
    .init(systemName: "gift.fill") ?? .add
  }
  
  static var giftCircle: UIImage {
    .init(systemName: "gift.circle") ?? .add
  }
  
  static var giftCircleFill: UIImage {
    .init(systemName: "gift.circle.fill") ?? .add
  }
  
  static var hourglassCircle: UIImage {
    .init(systemName: "hourglass.circle") ?? .add
  }
  
  static var hourglassCircleFill: UIImage {
    .init(systemName: "hourglass.circle.fill") ?? .add
  }
  
  static var battery100Percent: UIImage {
    .init(systemName: "battery.100percent") ?? .add
  }
  
  static var battery50Percent: UIImage {
    .init(systemName: "battery.50percent") ?? .add
  }
  
  static var battery100PercentBolt: UIImage {
    .init(systemName: "battery.100percent.bolt") ?? .add
  }
  
  static var checklist: UIImage {
    .init(systemName: "checklist") ?? .add
  }
  
  static var checklistChecked: UIImage {
    .init(systemName: "checklist.checked") ?? .add
  }
  
  static var listBullet: UIImage {
    .init(systemName: "list.bullet") ?? .add
  }
  
  static var listBulletCircle: UIImage {
    .init(systemName: "list.bullet.circle") ?? .add
  }
  
  static var listBulletCircleFill: UIImage {
    .init(systemName: "list.bullet.circle.fill") ?? .add
  }

  static var line3HorizontalDecreaseCircle: UIImage {
    .init(systemName: "line.3.horizontal.decrease.circle") ?? .add
  }
  
  static var line3HorizontalDecreaseCircleFill: UIImage {
    .init(systemName: "line.3.horizontal.decrease.circle.fill") ?? .add
  }
  
  static var line3HorizontalCircle: UIImage {
    .init(systemName: "line.3.horizontal.circle") ?? .add
  }
  
  static var line3HorizontalCircleFill: UIImage {
    .init(systemName: "line.3.horizontal.circle.fill") ?? .add
  }
  
  static var infoCircle: UIImage {
    .init(systemName: "info.circle") ?? .add
  }
  
  static var infoCircleFill: UIImage {
    .init(systemName: "info.circle.fill") ?? .add
  }
  
  static var exclamationmarkCircle: UIImage {
    .init(systemName: "exclamationmark.circle") ?? .add
  }
  
  static var exclamationmarkCircleFill: UIImage {
    .init(systemName: "exclamationmark.circle.fill") ?? .add
  }
  
  static var plus: UIImage {
    .init(systemName: "plus") ?? .add
  }
  
  static var plusCircle: UIImage {
    .init(systemName: "plus.circle") ?? .add
  }
  
  static var plusCircleFill: UIImage {
    .init(systemName: "plus.circle.fill") ?? .add
  }
  
  static var plusSquare: UIImage {
    .init(systemName: "plus.square") ?? .add
  }
  
  static var plusSquareFill: UIImage {
    .init(systemName: "plus.square.fill") ?? .add
  }
  
  static var minus: UIImage {
    .init(systemName: "minus") ?? .add
  }
  
  static var minusCircle: UIImage {
    .init(systemName: "minus.circle") ?? .add
  }
  
  static var minusCircleFill: UIImage {
    .init(systemName: "minus.circle.fill") ?? .add
  }
  
  static var multiply: UIImage {
    .init(systemName: "multiply") ?? .add
  }
  
  static var multiplyCircle: UIImage {
    .init(systemName: "multiply.circle") ?? .add
  }
  
  static var multiplyCircleFill: UIImage {
    .init(systemName: "multiply.circle.fill") ?? .add
  }
  
  static var xmark: UIImage {
    .init(systemName: "xmark") ?? .add
  }
  
  static var xmarkCircle: UIImage {
    .init(systemName: "xmark.circle") ?? .add
  }
  
  static var xmarkCircleFill: UIImage {
    .init(systemName: "xmark.circle.fill") ?? .add
  }
  
  static var xmarkSquare: UIImage {
    .init(systemName: "xmark.square") ?? .add
  }
  
  static var xmarkSquareFill: UIImage {
    .init(systemName: "xmark.square.fill") ?? .add
  }
  
  static var checkmark: UIImage {
    .init(systemName: "checkmark") ?? .add
  }
  
  static var checkmarkCircle: UIImage {
    .init(systemName: "checkmark.circle") ?? .add
  }
  
  static var checkmarkCircleFill: UIImage {
    .init(systemName: "checkmark.circle.fill") ?? .add
  }
  
  static var checkmarkSquare: UIImage {
    .init(systemName: "checkmark.square") ?? .add
  }
  
  static var checkmarkSquareFill: UIImage {
    .init(systemName: "checkmark.square.fill") ?? .add
  }
  
  static var chevronLeft: UIImage {
    .init(systemName: "chevron.left") ?? .add
  }
  
  static var chevronLeftCircle: UIImage {
    .init(systemName: "chevron.left.circle") ?? .add
  }
  
  static var chevronLeftCircleFill: UIImage {
    .init(systemName: "chevron.left.circle.fill") ?? .add
  }
  
  static var chevronLeftSquare: UIImage {
    .init(systemName: "chevron.left.square") ?? .add
  }
  
  static var chevronLeftSquareFill: UIImage {
    .init(systemName: "chevron.left.square.fill") ?? .add
  }
  
  static var chevronRight: UIImage {
    .init(systemName: "chevron.right") ?? .add
  }
  
  static var chevronRightCircle: UIImage {
    .init(systemName: "chevron.right.circle") ?? .add
  }
  
  static var chevronRightCircleFill: UIImage {
    .init(systemName: "chevron.right.circle.fill") ?? .add
  }
  
  static var chevronRightSquare: UIImage {
    .init(systemName: "chevron.right.square") ?? .add
  }
  
  static var chevronRightSquareFill: UIImage {
    .init(systemName: "chevron.right.square.fill") ?? .add
  }
  
  static var chevronUp: UIImage {
    .init(systemName: "chevron.up") ?? .add
  }
  
  static var chevronUpCircle: UIImage {
    .init(systemName: "chevron.up.circle") ?? .add
  }
  
  static var chevronUpCircleFill: UIImage {
    .init(systemName: "chevron.up.circle.fill") ?? .add
  }
  
  static var chevronUpSquare: UIImage {
    .init(systemName: "chevron.up.square") ?? .add
  }
  
  static var chevronUpSquareFill: UIImage {
    .init(systemName: "chevron.up.square.fill") ?? .add
  }
  
  static var chevronDown: UIImage {
    .init(systemName: "chevron.down") ?? .add
  }
  
  static var chevronDownCircle: UIImage {
    .init(systemName: "chevron.down.circle") ?? .add
  }
  
  static var chevronDownCircleFill: UIImage {
    .init(systemName: "chevron.down.circle.fill") ?? .add
  }
  
  static var chevronDownSquare: UIImage {
    .init(systemName: "chevron.down.square") ?? .add
  }
  
  static var chevronDownSquareFill: UIImage {
    .init(systemName: "chevron.down.square.fill") ?? .add
  }
  
  static var arrowLeft: UIImage {
    .init(systemName: "arrow.left") ?? .add
  }
  
  static var arrowLeftCircle: UIImage {
    .init(systemName: "arrow.left.circle") ?? .add
  }
  
  static var arrowLeftCircleFill: UIImage {
    .init(systemName: "arrow.left.circle.fill") ?? .add
  }
  
  static var arrowLeftSquare: UIImage {
    .init(systemName: "arrow.left.square") ?? .add
  }
  
  static var arrowLeftSquareFill: UIImage {
    .init(systemName: "arrow.left.square.fill") ?? .add
  }
  
  static var arrowRight: UIImage {
    .init(systemName: "arrow.right") ?? .add
  }
  
  static var arrowRightCircle: UIImage {
    .init(systemName: "arrow.right.circle") ?? .add
  }
  
  static var arrowRightCircleFill: UIImage {
    .init(systemName: "arrow.right.circle.fill") ?? .add
  }
  
  static var arrowRightSquare: UIImage {
    .init(systemName: "arrow.right.square") ?? .add
  }
  
  static var arrowRightSquareFill: UIImage {
    .init(systemName: "arrow.right.square.fill") ?? .add
  }
  
  static var arrowClockwise: UIImage {
    .init(systemName: "arrow.clockwise") ?? .add
  }
  
  static var arrowClockwiseCircle: UIImage {
    .init(systemName: "arrow.clockwise.circle") ?? .add
  }
  
  static var arrowClockwiseCircleFill: UIImage {
    .init(systemName: "arrow.clockwise.circle.fill") ?? .add
  }
  
  static var arrowCounterClockwise: UIImage {
    .init(systemName: "arrow.counterclockwise") ?? .add
  }
  
  static var arrowCounterClockwiseCircle: UIImage {
    .init(systemName: "arrow.counterclockwise.circle") ?? .add
  }
  
  static var arrowCounterClockwiseCircleFill: UIImage {
    .init(systemName: "arrow.counterclockwise.circle.fill") ?? .add
  }
  
  static var appleLogo: UIImage {
    .init(systemName: "apple.logo") ?? .add
  }
  
  static var randomElement: PlatformImage {
    allCases.randomElement() ?? .add
  }
  
  static var allCases = [Icon.person, Icon.personCircle, Icon.bell, Icon.star, Icon.share, Icon.shareCircle, Icon.shareFill, Icon.shareCircleFill, Icon.pencil, Icon.pencilCircle, Icon.pencilCircleFill, Icon.eraser, Icon.eraserFill, Icon.squarePencil, Icon.squarePencilCircle, Icon.pencilTip, Icon.pencilTipCircle, Icon.pencilTipCircleFill, Icon.trash, Icon.trashFill, Icon.trashCircle, Icon.trashCircleFill, Icon.trashSquare, Icon.trashSquareFill, Icon.folder, Icon.folderFill, Icon.folderCircle, Icon.folderCircleFill, Icon.folderBadge, Icon.folderBadgeFill, Icon.folderBadgeMinus, Icon.folderBadgeMinusFill, Icon.paperplane, Icon.paperplaneFill, Icon.paperplaneCircle, Icon.paperplaneCircleFill, Icon.doc, Icon.docFill, Icon.docCircle, Icon.docCircleFill, Icon.docText, Icon.docTextFill, Icon.docOn, Icon.docOnFill, Icon.clipboard, Icon.clipboardFill, Icon.listBulletClipboard, Icon.listBulletClipboardFill, Icon.docPlainText, Icon.docPlainTextFill, Icon.note, Icon.noteText, Icon.calendar, Icon.calendarCircle, Icon.calendarClock, Icon.book, Icon.bookCircle, Icon.bookCircleFill, Icon.bookFill, Icon.booksVertical, Icon.booksVerticalFill, Icon.booksVerticalCircle, Icon.booksVerticalCircleFill, Icon.bookmark, Icon.bookmarkFill, Icon.bookmarkCircle, Icon.bookmarkCircleFill, Icon.bookmarkSquare, Icon.bookmarkSquareFill, Icon.ruler, Icon.rulerFill, Icon.pencilAndRuler, Icon.pencilAndRulerFill, Icon.backpack, Icon.backpackFill, Icon.backpackCircle, Icon.backpackCircleFill, Icon.paperclip, Icon.paperclipCircle, Icon.paperclipCircleFill, Icon.link, Icon.linkCircle, Icon.linkCircleFill, Icon.personalHotspot, Icon.personalHotspotCircle, Icon.personalHotspotCircleFill, Icon.personCircleFill, Icon.personFill, Icon.shareplay, Icon.person2, Icon.person2Fill, Icon.person2Circle, Icon.person2CircleFill, Icon.person3, Icon.person3Fill, Icon.personCropCircle, Icon.personCropCircleFill, Icon.personCropSquare, Icon.personCropSquareFill, Icon.globe, Icon.network, Icon.sunMin, Icon.sunMinFill, Icon.sunMax, Icon.sunMaxFill, Icon.cloud, Icon.cloudFill, Icon.cloudRain, Icon.cloudRainFill, Icon.cloudBoltRain, Icon.cloudBoltRainFill, Icon.cloudSun, Icon.cloudSunFill, Icon.drop, Icon.dropFill, Icon.play, Icon.playFill, Icon.playCircle, Icon.playCircleFill, Icon.playSquare, Icon.playSquareFill, Icon.playRectangle, Icon.playRectangleFill, Icon.pause, Icon.pauseFill, Icon.pauseCircle, Icon.pauseCircleFill, Icon.pauseRectangle, Icon.pauseRectangleFill, Icon.stop, Icon.stopFill, Icon.stopCircle, Icon.stopCircleFill, Icon.recordCircle, Icon.recordCircleFill, Icon.playPause, Icon.playPauseFill, Icon.playPauseCircle, Icon.playPauseCircleFill, Icon.backward, Icon.backwardFill, Icon.backwardCircle, Icon.backwardCircleFill, Icon.forward, Icon.forwardFill, Icon.forwardCircle, Icon.forwardCircleFill, Icon.backwardEnd, Icon.backwardEndFill, Icon.forwardEnd, Icon.forwardEndFill, Icon.infinity, Icon.infinityCircle, Icon.sos, Icon.sosCircle, Icon.sosCircleFill, Icon.speaker, Icon.speakerFill, Icon.speakerSquare, Icon.speakerSquareFill, Icon.speakerPlus, Icon.speakerPlusFill, Icon.speakerMinus, Icon.speakerMinusFill, Icon.speakerWave3, Icon.speakerWave3Fill, Icon.musicNote, Icon.musicNoteList, Icon.musicMic, Icon.musicMicCircle, Icon.musicMicCircleFill, Icon.goForward5, Icon.goForward10, Icon.goForward15, Icon.goForward30, Icon.goForward45, Icon.goForward60, Icon.gobackward5, Icon.gobackward10, Icon.gobackward15, Icon.gobackward30, Icon.gobackward45, Icon.gobackward60, Icon.swift, Icon.swiftData, Icon.magnifyingGlass, Icon.magnifyingGlassCircle, Icon.magnifyingGlassCircleFill, Icon.mic, Icon.micFill, Icon.micCircle, Icon.micCircleFill, Icon.micSquare, Icon.micSquareFill, Icon.micSlash, Icon.micSlashFill, Icon.micSlashCircle, Icon.micSlashCircleFill, Icon.square, Icon.squareFill, Icon.squareStack, Icon.squareStackFill, Icon.capsule, Icon.capsuleFill, Icon.triangle, Icon.triangleFill, Icon.diamond, Icon.diamondFill, Icon.hexagon, Icon.hexagonFill, Icon.pentagon, Icon.pentagonFill, Icon.seal, Icon.sealFill, Icon.checkmarkSeal, Icon.checkmarkSealFill, Icon.xmarkSeal, Icon.xmarkSealFill, Icon.heart, Icon.heartFill, Icon.heartCircle, Icon.heartCircleFill, Icon.heartSquare, Icon.heartSquareFill, Icon.starFill, Icon.starCircle, Icon.starCircleFill, Icon.shield, Icon.shieldFill, Icon.flag, Icon.flagFill, Icon.flagCircle, Icon.flagCircleFill, Icon.location, Icon.locationFill, Icon.locationCircle, Icon.locationCircleFill, Icon.locationSquare, Icon.locationSquareFill, Icon.bellFill, Icon.bellCircle, Icon.bellCircleFill, Icon.bellSquare, Icon.bellSquareFill, Icon.bellBadge, Icon.bellBadgeFill, Icon.bellBadgeCircle, Icon.bellBadgeCircleFill, Icon.tag, Icon.tagFill, Icon.tagCircle, Icon.tagCircleFill, Icon.tagSquare, Icon.tagSquareFill, Icon.icloud, Icon.icloudFill, Icon.icloudCircle, Icon.icloudCircleFill, Icon.arrowClockwiseIcloud, Icon.arrowClockwiseIcloudFill, Icon.flashlightOffFill, Icon.flashlightOnFill, Icon.camera, Icon.cameraFill, Icon.cameraCircle, Icon.cameraCircleFill, Icon.message, Icon.messageFill, Icon.messageCircle, Icon.messageCircleFill, Icon.phone, Icon.phoneFill, Icon.phoneCircle, Icon.phoneCircleFill, Icon.video, Icon.videoFill, Icon.videoCircle, Icon.videoCircleFill, Icon.videoSquare, Icon.videoSquareFill, Icon.envelope, Icon.envelopeFill, Icon.gear, Icon.gearCircle, Icon.gearCircleFill, Icon.ellipsis, Icon.ellipsisCircle, Icon.ellipsisCircleFill, Icon.bag, Icon.bagFill, Icon.bagCircle, Icon.bagCircleFill, Icon.cart, Icon.cartFill, Icon.creditcard, Icon.creditCardFill, Icon.giftCard, Icon.giftCardFill, Icon.printer, Icon.printerFill, Icon.house, Icon.houseFill, Icon.houseCircle, Icon.houseCircleFill, Icon.lightbulb, Icon.lightbulbFill, Icon.lightbulbMax, Icon.lightbulbMaxFill, Icon.lock, Icon.lockFill, Icon.lockRotation, Icon.lockOpenRotation, Icon.wifi, Icon.wifiCircle, Icon.wifiCircleFill, Icon.wifiSquare, Icon.wifiSquareFill, Icon.pin, Icon.pinFill, Icon.pinCircle, Icon.pinCircleFill, Icon.pinSquare, Icon.pinSquareFill, Icon.mappin, Icon.mappinCircle, Icon.mappinCircleFill, Icon.mappinAndEllipseCircle, Icon.mappinAndEllipseCircleFill, Icon.map, Icon.mapFill, Icon.mapCircle, Icon.mapCircleFill, Icon.safari, Icon.safariFill, Icon.rotateLeft, Icon.rotateLeftFill, Icon.rotateRight, Icon.rotateRightFill, Icon.faceid, Icon.display, Icon.laptopcomputer, Icon.iphone, Icon.ipad, Icon.visionpro, Icon.applewatch, Icon.headphones, Icon.qrcodeViewFinder, Icon.barcodeViewFinder, Icon.cameraViewFinder, Icon.locationViewFinder, Icon.locationFillViewFinder, Icon.docViewFinder, Icon.photo, Icon.photoFill, Icon.photoCircle, Icon.photoCircleFill, Icon.clock, Icon.clockFill, Icon.stopwatch, Icon.stopwatchFill, Icon.arrowCirclePath, Icon.cylinder, Icon.cylinderFill, Icon.cellularbars, Icon.chartPie, Icon.chartPieFill, Icon.waveformPath, Icon.waveformCircle, Icon.waveformCircleFill, Icon.touchid, Icon.atom, Icon.angle, Icon.chartxyaxisLine, Icon.chartLineUptrendxyaxis, Icon.chartLineDowntrendxyaxis, Icon.gift, Icon.giftFill, Icon.giftCircle, Icon.giftCircleFill, Icon.hourglassCircle, Icon.hourglassCircleFill, Icon.battery100Percent, Icon.battery50Percent, Icon.battery100PercentBolt, Icon.checklist, Icon.checklistChecked, Icon.listBullet, Icon.listBulletCircle, Icon.listBulletCircleFill, Icon.line3HorizontalDecreaseCircle, Icon.line3HorizontalDecreaseCircleFill, Icon.line3HorizontalCircle, Icon.line3HorizontalCircleFill, Icon.infoCircle, Icon.infoCircleFill, Icon.exclamationmarkCircle, Icon.exclamationmarkCircleFill, Icon.plus, Icon.plusCircle, Icon.plusCircleFill, Icon.plusSquare, Icon.plusSquareFill, Icon.minus, Icon.minusCircle, Icon.minusCircleFill, Icon.multiply, Icon.multiplyCircle, Icon.multiplyCircleFill, Icon.xmark, Icon.xmarkCircle, Icon.xmarkCircleFill, Icon.xmarkSquare, Icon.xmarkSquareFill, Icon.checkmark, Icon.checkmarkCircle, Icon.checkmarkCircleFill, Icon.checkmarkSquare, Icon.checkmarkSquareFill, Icon.chevronLeft, Icon.chevronLeftCircle, Icon.chevronLeftCircleFill, Icon.chevronLeftSquare, Icon.chevronLeftSquareFill, Icon.chevronRight, Icon.chevronRightCircle, Icon.chevronRightCircleFill, Icon.chevronRightSquare, Icon.chevronRightSquareFill, Icon.chevronUp, Icon.chevronUpCircle, Icon.chevronUpCircleFill, Icon.chevronUpSquare, Icon.chevronUpSquareFill, Icon.chevronDown, Icon.chevronDownCircle, Icon.chevronDownCircleFill, Icon.chevronDownSquare, Icon.chevronDownSquareFill, Icon.arrowLeft, Icon.arrowLeftCircle, Icon.arrowLeftCircleFill, Icon.arrowLeftSquare, Icon.arrowLeftSquareFill, Icon.arrowRight, Icon.arrowRightCircle, Icon.arrowRightCircleFill, Icon.arrowRightSquare, Icon.arrowRightSquareFill, Icon.arrowClockwise, Icon.arrowClockwiseCircle, Icon.arrowClockwiseCircleFill, Icon.arrowCounterClockwise, Icon.arrowCounterClockwiseCircle, Icon.arrowCounterClockwiseCircleFill, Icon.appleLogo
  ]
}

