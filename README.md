# iOSAlignmentIndicatorViews

This is an iOS component to assist in aligning Views by creating lines similar to image editing programs such as Photoshop and Sketch.

![iOSAlignmentIndicatorViews](https://raw.githubusercontent.com/gbmiranda/iOSAlignmentIndicatorViews/master/Example.png)

# How to use

1. Add AlignmentIndicatorViews.swift to your project.
2. Call AlignmentIndicatorViews shared instance.

```swift
AlignmentIndicatorViews.shared.identifyViews(currentView: viewDrag, parentView: self.view, otherViews: self.draggableViews)
```

# Customization

## width
Use the width property to set the width of the lines.

```swift
private var lineWidth: CGFloat = 0.6
```

## color
Use the color property to set the color of the lines.

```swift
private var lineColor = UIColor.red
```

## More Properties
Before inserting new lines it is necessary to clean existing ones.

```swift
AlignmentIndicatorViews.shared.clearLayersLines()
```

# Author
Gabriel Braga | http://www.gabrielbraga.com


