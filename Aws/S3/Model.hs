{-# LANGUAGE OverloadedStrings #-}
module Aws.S3.Model
where

import           Data.ByteString.Char8 ({- IsString -})
import           Data.Time
import qualified Data.ByteString       as B

type CanonicalUserId = B.ByteString

type Bucket = B.ByteString

data BucketInfo
    = BucketInfo {
        bucketName :: Bucket
      , bucketCreationDate :: UTCTime
      }

data LocationConstraint 
    = EU | UsWest1 | ApSouthEast1 | UsClassic
    deriving (Show)

locationConstraintToId :: LocationConstraint -> B.ByteString
locationConstraintToId lc
    = case lc of
        EU -> "EU"
        UsWest1 -> "us-west-1"
        ApSouthEast1 -> "ap-southeast-1"
        UsClassic -> ""

idToLocationConstraint :: B.ByteString -> Maybe LocationConstraint
idToLocationConstraint i    
    = case i of
        "EU" -> Just EU
        "us-west-1" -> Just UsWest1
        "ap-southeast-1" -> Just ApSouthEast1
        "" -> Just UsClassic
        _ -> Nothing
