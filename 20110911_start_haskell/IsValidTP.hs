module IsValidTP (isValidTP) where

length3d :: (Float, Float, Float) -> (Float, Float, Float) -> Float
length3d (x1, y1, z1) (x2, y2, z2) =
  sqrt ((x1 - x2) ** 2 + (y1 - y2) ** 2 + (z1 - z2) ** 2)

diff3d :: (Float, Float, Float) -> (Float, Float, Float) -> (Float, Float, Float)
diff3d (x1, y1, z1) (x2, y2, z2) = (x1 - x2, y1 - y2, z1 - z2)

isValidTP :: (Float, Float, Float)
             -> (Float, Float, Float)
             -> (Float, Float, Float)
             -> (Float, Float, Float)
             -> (Float, Float, Float)
             -> (Float, Float, Float)
             -> Bool
isValidTP p1 p2 p3 p4 p5 p6 =
  -- plane 1 2 3 4
  length3d p1 p2 == length3d p3 p4
  && length3d p1 p4 == length3d p2 p3
  && length3d p1 p3 == length3d p4 p2
  && diff3d p1 p2 == diff3d p4 p3
  && diff3d p1 p4 == diff3d p2 p3
  -- plane 3 4 6 5
  && length3d p3 p4 == length3d p5 p6
  && length3d p3 p5 == length3d p4 p6
  && length3d p3 p6 == length3d p4 p5
  && diff3d p4 p3 == diff3d p6 p5
  && diff3d p4 p6 == diff3d p3 p5
