{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE InstanceSigs #-}

-----------------------------------------------------------------------------

-- Module      :  Distribution.Client.Errors
-- Copyright   :  Suganya Arun
-- License     :  BSD3
-- Maintainer  :  cabal-devel@haskell.org
-- Portability :  portable

-- A collection of Exception Types in the Cabal-Install library package

module Distribution.Client.Errors
  ( CabalInstallException (..)
  , exceptionCodeCabalInstall
  , exceptionMessageCabalInstall
  ) where

import Distribution.Compat.Prelude
import Distribution.Deprecated.ParseUtils (PWarning, showPWarning)
import Distribution.Package
import Distribution.Pretty
import Distribution.Simple (VersionRange)
import Distribution.Simple.Utils
import Text.Regex.Posix.ByteString (WrapError)

data CabalInstallException
  = UnpackGet
  | NotTarballDir FilePath
  | DirectoryAlreadyExists FilePath
  | FileExists FilePath
  | FileAlreadyExists FilePath
  | DirectoryExists FilePath
  | SplitRunArgs String
  | CouldNotFindExecutable
  | FoundMultipleMatchingExes
  | NoRemoteRepositories
  | NotATarDotGzFile FilePath
  | ExpectedMatchingFileName
  | NoTargetProvided
  | OneTargetRequired
  | ThisIsABug
  | NoOrMultipleTargetsGiven
  | NoTargetFound
  | MultipleTargetsFound
  | UnexpectedNamedPkgSpecifiers
  | UnexpectedSourcePkgSpecifiers
  | UnableToPerformInplaceUpdate
  | EmptyValuePagerEnvVariable
  | FileDoesntExist FilePath
  | ParseError
  | CabalFileNotFound FilePath
  | FindOpenProgramLocationErr String
  | PkgConfParseFailed String
  | ErrorPackingSdist String
  | SdistException PackageIdentifier
  | SpecifyAnExecutable
  | TestCommandDoesn'tSupport
  | ReportTargetProblems String
  | ListBinTargetException String
  | ResolveWithoutDependency String
  | CannotReadCabalFile FilePath
  | ErrorUpdatingIndex FilePath IOException
  | InternalError FilePath
  | ReadIndexCache FilePath
  | ConfigStateFileException String
  | UploadAction
  | UploadActionDocumentation
  | UploadActionOnlyArchives [FilePath]
  | FileNotFound FilePath
  | CheckAction [String]
  | ReportAction [String]
  | InitAction
  | UserConfigAction FilePath
  | SpecifySubcommand
  | UnknownUserConfigSubcommand [String]
  | ManpageAction [String]
  | UnrecognizedResponse
  | CheckTarget
  | FetchPackage
  | PlanPackages String
  | NoSupportForRunCommand
  | RunPhaseReached
  | UnknownExecutable String UnitId
  | MultipleMatchingExecutables String [String]
  | CmdRunReportTargetProblems String
  | CleanAction [String]
  | ReportCannotPruneDependencies String
  | ReplCommandDoesn'tSupport
  | ReplTakesNoArguments [String]
  | ReplTakesSingleArgument [String]
  | RenderReplTargetProblem [String]
  | GetPkgList String WrapError
  | GatherPkgInfo PackageName VersionRange
  | UnableToParseRepo String
  | NullUnknownrepos [String] [String]
  | UpdateSetupScript
  | InstalledCabalVersion PackageName VersionRange
  | FailNoConfigFile String
  | ParseFailedErr FilePath String String
  | ParseExtraLinesFailedErr String String
  | ParseExtraLinesOkError [PWarning]
  | FetchPackageErr
  | ReportParseResult String FilePath String String
  | ReportSourceRepoProblems String
  | BenchActionException
  | RenderBenchTargetProblem [String]
  | ReportUserTargetProblems [String]
  | ReportUserTargerNonexistantFile [String]
  | ReportUserTargetUnexpectedFile [String]
  | ReportUserTargetUnexpectedUriScheme [String]
  | ReportUserTargetUnrecognisedUri [String]
  | ReadTarballPackageTarget FilePath FilePath
  | ReportPackageTargetProblems [PackageName]
  | PackageNameAmbiguousErr [(PackageName, [PackageName])]
  | ExtractTarballPackageErr String
  | OutdatedAction
  | FreezeFileExistsErr FilePath
  | FinalizePDFailed
  | ProjectTargetSelector String String
  deriving (Show, Typeable)

exceptionCodeCabalInstall :: CabalInstallException -> Int
exceptionCodeCabalInstall e = case e of
  UnpackGet{} -> 7013
  NotTarballDir{} -> 7012
  DirectoryAlreadyExists{} -> 7014
  FileExists{} -> 7015
  FileAlreadyExists{} -> 7016
  DirectoryExists{} -> 7017
  SplitRunArgs{} -> 7018
  CouldNotFindExecutable{} -> 7019
  FoundMultipleMatchingExes{} -> 7020
  NoRemoteRepositories{} -> 7021
  NotATarDotGzFile{} -> 7022
  ExpectedMatchingFileName{} -> 7023
  NoTargetProvided{} -> 7024
  OneTargetRequired{} -> 7025
  ThisIsABug -> 7026
  NoOrMultipleTargetsGiven{} -> 7027
  NoTargetFound{} -> 7028
  MultipleTargetsFound{} -> 7029
  UnexpectedNamedPkgSpecifiers{} -> 7030
  UnexpectedSourcePkgSpecifiers{} -> 7031
  UnableToPerformInplaceUpdate{} -> 7032
  EmptyValuePagerEnvVariable{} -> 7033
  FileDoesntExist{} -> 7034
  ParseError{} -> 7035
  CabalFileNotFound{} -> 7036
  FindOpenProgramLocationErr{} -> 7037
  PkgConfParseFailed{} -> 7038
  ErrorPackingSdist{} -> 7039
  SdistException{} -> 7040
  SpecifyAnExecutable{} -> 7041
  TestCommandDoesn'tSupport{} -> 7042
  ReportTargetProblems{} -> 7043
  ListBinTargetException{} -> 7044
  ResolveWithoutDependency{} -> 7045
  CannotReadCabalFile{} -> 7046
  ErrorUpdatingIndex{} -> 7047
  InternalError{} -> 7048
  ReadIndexCache{} -> 7049
  ConfigStateFileException{} -> 7050
  UploadAction{} -> 7051
  UploadActionDocumentation{} -> 7052
  UploadActionOnlyArchives{} -> 7053
  FileNotFound{} -> 7054
  CheckAction{} -> 7055
  ReportAction{} -> 7056
  InitAction{} -> 7057
  UserConfigAction{} -> 7058
  SpecifySubcommand{} -> 7059
  UnknownUserConfigSubcommand{} -> 7060
  ManpageAction{} -> 7061
  UnrecognizedResponse{} -> 7062
  CheckTarget{} -> 7063
  FetchPackage{} -> 7064
  PlanPackages{} -> 7065
  NoSupportForRunCommand{} -> 7066
  RunPhaseReached{} -> 7067
  UnknownExecutable{} -> 7068
  MultipleMatchingExecutables{} -> 7069
  CmdRunReportTargetProblems{} -> 7070
  CleanAction{} -> 7071
  ReportCannotPruneDependencies{} -> 7072
  ReplCommandDoesn'tSupport{} -> 7073
  ReplTakesNoArguments{} -> 7074
  ReplTakesSingleArgument{} -> 7075
  RenderReplTargetProblem{} -> 7076
  GetPkgList{} -> 7078
  GatherPkgInfo{} -> 7079
  UnableToParseRepo{} -> 7080
  NullUnknownrepos{} -> 7081
  UpdateSetupScript{} -> 7082
  InstalledCabalVersion{} -> 7083
  FailNoConfigFile{} -> 7084
  ParseFailedErr{} -> 7085
  ParseExtraLinesFailedErr{} -> 7087
  ParseExtraLinesOkError{} -> 7088
  FetchPackageErr{} -> 7089
  ReportParseResult{} -> 7090
  ReportSourceRepoProblems{} -> 7091
  BenchActionException{} -> 7092
  RenderBenchTargetProblem{} -> 7093
  ReportUserTargetProblems{} -> 7094
  ReportUserTargerNonexistantFile{} -> 7095
  ReportUserTargetUnexpectedFile{} -> 7096
  ReportUserTargetUnexpectedUriScheme{} -> 7097
  ReportUserTargetUnrecognisedUri{} -> 7098
  ReadTarballPackageTarget{} -> 7099
  ReportPackageTargetProblems{} -> 7100
  PackageNameAmbiguousErr{} -> 7101
  ExtractTarballPackageErr{} -> 7102
  OutdatedAction{} -> 7103
  FreezeFileExistsErr{} -> 7104
  FinalizePDFailed{} -> 7105
  ProjectTargetSelector{} -> 7106
exceptionMessageCabalInstall :: CabalInstallException -> String
exceptionMessageCabalInstall e = case e of
  UnpackGet ->
    "The 'get' command does no yet support targets "
      ++ "that are remote source repositories."
  NotTarballDir t ->
    "The 'get' command is for tarball packages. "
      ++ "The target '"
      ++ t
      ++ "' is not a tarball."
  DirectoryAlreadyExists pkgdir' -> "The directory \"" ++ pkgdir' ++ "\" already exists and is not empty, not unpacking."
  FileExists pkgdir -> "A file \"" ++ pkgdir ++ "\" is in the way, not unpacking."
  FileAlreadyExists pkgFile -> "The file \"" ++ pkgFile ++ "\" already exists, not overwriting."
  DirectoryExists pkgFile -> "A directory \"" ++ pkgFile ++ "\" is in the way, not unpacking."
  SplitRunArgs err -> err
  CouldNotFindExecutable -> "run: Could not find executable in LocalBuildInfo"
  FoundMultipleMatchingExes -> "run: Found multiple matching exes in LocalBuildInfo"
  NoRemoteRepositories -> "Cannot upload. No remote repositories are configured."
  NotATarDotGzFile path -> "Not a tar.gz file: " ++ path
  ExpectedMatchingFileName -> "Expected a file name matching the pattern <pkgid>-docs.tar.gz"
  NoTargetProvided -> "One target is required, none provided"
  OneTargetRequired -> "One target is required, given multiple"
  ThisIsABug ->
    "No or multiple targets given, but the run "
      ++ "phase has been reached. This is a bug."
  NoOrMultipleTargetsGiven -> "No or multiple targets given..."
  NoTargetFound -> "No target found"
  MultipleTargetsFound -> "Multiple targets found"
  UnexpectedNamedPkgSpecifiers ->
    "internal error: 'resolveUserTargets' returned "
      ++ "unexpected named package specifiers!"
  UnexpectedSourcePkgSpecifiers ->
    "internal error: 'resolveUserTargets' returned "
      ++ "unexpected source package specifiers!"
  UnableToPerformInplaceUpdate -> "local project file has conditional and/or import logic, unable to perform and automatic in-place update"
  EmptyValuePagerEnvVariable -> "man: empty value of the PAGER environment variable"
  FileDoesntExist fpath -> "Error Parsing: file \"" ++ fpath ++ "\" doesn't exist. Cannot continue."
  ParseError -> "parse error"
  CabalFileNotFound cabalFile -> "Package .cabal file not found in the tarball: " ++ cabalFile
  FindOpenProgramLocationErr err -> err
  PkgConfParseFailed perror ->
    "Couldn't parse the output of 'setup register --gen-pkg-config':"
      ++ show perror
  ErrorPackingSdist err -> "Error packing sdist: " ++ err
  SdistException pkgIdentifier -> "sdist of " ++ prettyShow pkgIdentifier
  SpecifyAnExecutable -> "Please specify an executable to run"
  TestCommandDoesn'tSupport ->
    "The test command does not support '--only-dependencies'. "
      ++ "You may wish to use 'build --only-dependencies' and then "
      ++ "use 'test'."
  ReportTargetProblems problemsMsg -> problemsMsg
  ListBinTargetException errorStr -> errorStr
  ResolveWithoutDependency errorStr -> errorStr
  CannotReadCabalFile file -> "Cannot read .cabal file inside " ++ file
  ErrorUpdatingIndex name ioe -> "Error while updating index for " ++ name ++ " repository " ++ show ioe
  InternalError msg ->
    "internal error when reading package index: "
      ++ msg
      ++ "The package index or index cache is probably "
      ++ "corrupt. Running cabal update might fix it."
  ReadIndexCache path -> show (path)
  ConfigStateFileException err -> err
  UploadAction -> "the 'upload' command expects at least one .tar.gz archive."
  UploadActionDocumentation ->
    "the 'upload' command can only upload documentation "
      ++ "for one package at a time."
  UploadActionOnlyArchives otherFiles ->
    "the 'upload' command expects only .tar.gz archives: "
      ++ intercalate ", " otherFiles
  FileNotFound tarfile -> "file not found: " ++ tarfile
  CheckAction extraArgs -> "'check' doesn't take any extra arguments: " ++ unwords extraArgs
  ReportAction extraArgs -> "'report' doesn't take any extra arguments: " ++ unwords extraArgs
  InitAction ->
    "'init' only takes a single, optional, extra "
      ++ "argument for the project root directory"
  UserConfigAction path -> path ++ " already exists."
  SpecifySubcommand -> "Please specify a subcommand (see 'help user-config')"
  UnknownUserConfigSubcommand extraArgs -> "Unknown 'user-config' subcommand: " ++ unwords extraArgs
  ManpageAction extraArgs -> "'man' doesn't take any extra arguments: " ++ unwords extraArgs
  UnrecognizedResponse -> "unrecognized response"
  CheckTarget ->
    "The 'fetch' command does not yet support remote tarballs. "
      ++ "In the meantime you can use the 'get' commands."
  FetchPackage ->
    "The 'fetch' command does not yet support remote "
      ++ "source repositories."
  PlanPackages errorStr -> errorStr
  NoSupportForRunCommand ->
    "The run command does not support '--only-dependencies'. "
      ++ "You may wish to use 'build --only-dependencies' and then "
      ++ "use 'run'."
  RunPhaseReached ->
    "No or multiple targets given, but the run "
      ++ "phase has been reached. This is a bug."
  UnknownExecutable exeName selectedUnitId ->
    "Unknown executable "
      ++ exeName
      ++ " in package "
      ++ prettyShow selectedUnitId
  MultipleMatchingExecutables exeName elabUnitId ->
    "Multiple matching executables found matching "
      ++ exeName
      ++ ":\n"
      ++ unlines elabUnitId
  CmdRunReportTargetProblems renderProb -> renderProb
  CleanAction notScripts ->
    "'clean' extra arguments should be script files: "
      ++ unwords notScripts
  ReportCannotPruneDependencies renderCannotPruneDependencies -> renderCannotPruneDependencies
  ReplCommandDoesn'tSupport ->
    "The repl command does not support '--only-dependencies'. "
      ++ "You may wish to use 'build --only-dependencies' and then "
      ++ "use 'repl'."
  ReplTakesNoArguments targetStrings -> "'repl' takes no arguments or a script argument outside a project: " ++ unwords targetStrings
  ReplTakesSingleArgument targetStrings -> "'repl' takes a single argument which should be a script: " ++ unwords targetStrings
  RenderReplTargetProblem renderProblem -> unlines renderProblem
  GetPkgList pat err -> "Failed to compile regex " ++ pat ++ ": " ++ snd err
  GatherPkgInfo name verConstraint ->
    "There is no available version of "
      ++ prettyShow name
      ++ " that satisfies "
      ++ prettyShow verConstraint
  UnableToParseRepo s -> "'v2-update' unable to parse repo: \"" ++ s ++ "\""
  NullUnknownrepos unRepoName remoteRepoNames ->
    "'v2-update' repo(s): \""
      ++ intercalate "\", \"" unRepoName
      ++ "\" can not be found in known remote repo(s): "
      ++ intercalate ", " remoteRepoNames
  UpdateSetupScript -> "Using 'build-type: Custom' but there is no Setup.hs or Setup.lhs script."
  InstalledCabalVersion name verRange ->
    "The package '"
      ++ prettyShow name
      ++ "' requires Cabal library version "
      ++ prettyShow verRange
      ++ " but no suitable version is installed."
  FailNoConfigFile msgNotFound ->
    unlines
      [ msgNotFound
      , "(Config files can be created via the cabal-command 'user-config init'.)"
      ]
  ParseFailedErr configFile msg line ->
    "Error parsing config file "
      ++ configFile
      ++ line
      ++ ":\n"
      ++ msg
  ParseExtraLinesFailedErr msg line ->
    "Error parsing additional config lines\n"
      ++ line
      ++ ":\n"
      ++ msg
  ParseExtraLinesOkError ws -> unlines (map (showPWarning "Error parsing additional config lines") ws)
  FetchPackageErr -> "fetchPackage: source repos not supported"
  ReportParseResult filetype filename line msg ->
    "Error parsing "
      ++ filetype
      ++ " "
      ++ filename
      ++ line
      ++ ":\n"
      ++ msg
  ReportSourceRepoProblems errorStr -> errorStr
  BenchActionException ->
    "The bench command does not support '--only-dependencies'. "
      ++ "You may wish to use 'build --only-dependencies' and then "
      ++ "use 'bench'."
  RenderBenchTargetProblem errorStr -> unlines errorStr
  ReportUserTargetProblems target ->
    unlines
      [ "Unrecognised target '" ++ name ++ "'."
      | name <- target
      ]
      ++ "Targets can be:\n"
      ++ " - package names, e.g. 'pkgname', 'pkgname-1.0.1', 'pkgname < 2.0'\n"
      ++ " - cabal files 'pkgname.cabal' or package directories 'pkgname/'\n"
      ++ " - package tarballs 'pkgname.tar.gz' or 'http://example.com/pkgname.tar.gz'"
  ReportUserTargerNonexistantFile target ->
    unlines
      [ "The file does not exist '" ++ name ++ "'."
      | name <- target
      ]
  ReportUserTargetUnexpectedFile target ->
    unlines
      [ "Unrecognised file target '" ++ name ++ "'."
      | name <- target
      ]
      ++ "File targets can be either package tarballs 'pkgname.tar.gz' "
      ++ "or cabal files 'pkgname.cabal'."
  ReportUserTargetUnexpectedUriScheme target ->
    unlines
      [ "URL target not supported '" ++ name ++ "'."
      | name <- target
      ]
      ++ "Only 'http://' and 'https://' URLs are supported."
  ReportUserTargetUnrecognisedUri target ->
    unlines
      [ "Unrecognise URL target '" ++ name ++ "'."
      | name <- target
      ]
  ReadTarballPackageTarget filename tarballFile ->
    "Could not parse the cabal file "
      ++ filename
      ++ " in "
      ++ tarballFile
  ReportPackageTargetProblems pkgs ->
    unlines
      [ "There is no package named '" ++ prettyShow name ++ "'. "
      | name <- pkgs
      ]
      ++ "You may need to run 'cabal update' to get the latest "
      ++ "list of available packages."
  PackageNameAmbiguousErr ambiguities ->
    unlines
      [ "There is no package named '"
        ++ prettyShow name
        ++ "'. "
        ++ ( if length matches > 1
              then "However, the following package names exist: "
              else "However, the following package name exists: "
           )
        ++ intercalate ", " ["'" ++ prettyShow m ++ "'" | m <- matches]
        ++ "."
      | (name, matches) <- ambiguities
      ]
  ExtractTarballPackageErr err -> err
  OutdatedAction -> "--project-dir and --project-file must only be used with --v2-freeze-file."
  FreezeFileExistsErr freezeFile ->
    "Couldn't find a freeze file expected at: "
      ++ freezeFile
      ++ "\n\n"
      ++ "We are looking for this file because you supplied '--project-file' or '--v2-freeze-file'. "
      ++ "When one of these flags is given, we try to read the dependencies from a freeze file. "
      ++ "If it is undesired behaviour, you should not use these flags, otherwise please generate "
      ++ "a freeze file via 'cabal freeze'."
  FinalizePDFailed -> "finalizePD failed"
  ProjectTargetSelector input err -> "Invalid package ID: " ++ input ++ "\n" ++ err

instance Exception (VerboseException CabalInstallException) where
  displayException :: VerboseException CabalInstallException -> [Char]
  displayException (VerboseException stack timestamp verb cabalInstallException) =
    withOutputMarker
      verb
      ( concat
          [ "Error: [Cabal-"
          , show (exceptionCodeCabalInstall cabalInstallException)
          , "]\n"
          ]
      )
      ++ exceptionWithMetadata stack timestamp verb (exceptionMessageCabalInstall cabalInstallException)
