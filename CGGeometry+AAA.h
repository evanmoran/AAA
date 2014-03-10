//
//  CGGeometry+AAA.h
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#include <CoreGraphics/CGGeometry.h>

CG_INLINE CGFloat CGFloatClamp(CGFloat t, CGFloat a, CGFloat b) {
    return MAX(a, MIN(t, b));
}

CG_INLINE CGPoint CGPointAdd(CGPoint p, CGPoint q) {
    return CGPointMake(p.x + q.x, p.y + q.y);
}

#define CGPointScale(p, s) ({ \
    _Generic( (const __typeof__(s)){0}, \
        const struct CGPoint: CGPointScaleWithPoint, \
        default: CGPointScaleWithFloat \
    )(p, s); \
})

CG_INLINE CGPoint CGPointScaleWithFloat(CGPoint p, CGFloat s) {
    return CGPointMake(p.x * s, p.y * s);
}
CG_INLINE CGPoint CGPointScaleWithPoint(CGPoint p, CGPoint s) {
    return CGPointMake(p.x * s.x, p.y * s.y);
}

CG_INLINE CGRect CGRectSetOrigin(CGRect r, CGPoint p) {
    r.origin = p;
    return r;
}

CG_INLINE CGRect CGRectSetSize(CGRect r, CGSize s) {
    r.size = s;
    return r;
}

CG_INLINE CGRect CGRectSetMinX(CGRect r, CGFloat x) {
    r.origin.x = x;
    return r;
}

CG_INLINE CGRect CGRectSetMinY(CGRect r, CGFloat y) {
    r.origin.y = y;
    return r;
}

CG_INLINE CGRect CGRectSetWidth(CGRect r, CGFloat w) {
    r.size.width = w;
    return r;
}

CG_INLINE CGRect CGRectSetHeight(CGRect r, CGFloat h) {
    r.size.height = h;
    return r;
}

CG_INLINE CGRect CGRectCenteredInRect(CGRect container, CGSize size) {
    return CGRectMake(
        floor((CGRectGetWidth(container) - size.width) * 0.5),
        floor((CGRectGetHeight(container) - size.height) * 0.5),
        size.width, size.height);
}

CG_INLINE CGPoint CGPointTranspose(CGPoint p) {
    return CGPointMake(p.y, p.x);
}

CG_INLINE CGSize CGSizeTranspose(CGSize s) {
    return CGSizeMake(s.height, s.width);
}

CG_INLINE CGRect CGRectTranspose(CGRect r) {
    r.origin = CGPointTranspose(r.origin);
    r.size = CGSizeTranspose(r.size);
    return r;
}

CG_INLINE CGPoint CGRectGetCenter(CGRect r) {
    return CGPointMake(CGRectGetMidX(r), CGRectGetMidY(r));
}

//CG_INLINE BOOL CGRectContainsPoint(CGRect r, CGPoint p) {
//    return CGRectGetMinX(r) <= p.x && p.x <= CGRectGetMaxX(r)
//        && CGRectGetMinY(r) <= p.y && p.y <= CGRectGetMaxY(r);
//}
