
# Generated by crate2nix 0.7.0-alpha.1 with the command:
#   "generate" "-f" "sample_projects/numtest/Cargo.toml" "-o" "sample_projects/numtest/Cargo.nix"
# See https://github.com/kolloch/crate2nix for more info.

{ pkgs? import <nixpkgs> { config = {}; },
  lib? pkgs.lib,
  callPackage? pkgs.callPackage,
  stdenv? pkgs.stdenv,
  buildRustCrate? pkgs.buildRustCrate,
  fetchurl? pkgs.fetchurl,
  fetchCrate? pkgs.fetchCrate,
  defaultCrateOverrides? pkgs.defaultCrateOverrides,
  # The features to enable for the root_crate or the workspace_members.
  rootFeatures? ["default"]}:

rec {
  #
  # "public" attributes that we attempt to keep stable with new versions of crate2nix.
  #

  rootCrate = rec {
    packageId = "numtest 0.1.0 (path+file:///home/peter/projects/crate2nix/sample_projects/numtest)";

    # Use this attribute to refer to the derivation building your root crate package.
    # You can override the features with rootCrate.build.override { features = [ "default" "feature1" ... ]; }.
    build = buildRustCrateWithFeatures {
      features = rootFeatures;
      inherit packageId;
    };

    # Debug support which might change between releases.
    # File a bug if you depend on any for non-debug work!
    debug = debugCrate { inherit packageId; };
  };
  root_crate =
    builtins.trace "root_crate is deprecated since crate2nix 0.4. Please use rootCrate instead." rootCrate.build;
  # Refer your crate build derivation by name here.
  # You can override the features with
  # workspaceMembers."${crateName}".build.override { features = [ "default" "feature1" ... ]; }.
  workspaceMembers = {
    "numtest" = rec {
      packageId = "numtest 0.1.0 (path+file:///home/peter/projects/crate2nix/sample_projects/numtest)";
      build = buildRustCrateWithFeatures {
        packageId = "numtest 0.1.0 (path+file:///home/peter/projects/crate2nix/sample_projects/numtest)";
        features = rootFeatures;
      };
      
      # Debug support which might change between releases.
      # File a bug if you depend on any for non-debug work!
      debug = debugCrate { inherit packageId; };
    };
  };
  workspace_members =
    builtins.trace
      "workspace_members is deprecated in crate2nix 0.4. Please use workspaceMembers instead."
      lib.mapAttrs (n: v: v.build) workspaceMembers;

  #
  # "private" attributes that may change in every new version of crate2nix.
  #

  # Build and dependency information for crates.
  # Many of the fields are passed one-to-one to buildRustCrate.
  #
  # Noteworthy:
  # * `crateBin = [{name = ","; path = ",";}];`: a hack to disable building the binary.
  # * `dependencies`/`buildDependencies`: similar to the corresponding fields for buildRustCrate.
  #   but with additional information which is used during dependency/feature resolution.
  # * `resolvedDependencies`: the selected default features reported by cargo - only included for debugging.

  crates = {
    "autocfg 0.1.5 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "autocfg";
        version = "0.1.5";
        edition = "2015";
        sha256 = "1f3bj604fyr4xh08r357hs3hpdzapiqgccvmj1jpi953ffqrp09a";
        authors = [
          "Josh Stone <cuviper@gmail.com>"
        ];
        features = {
        };
      };
    "num 0.2.0 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "num";
        version = "0.2.0";
        edition = "2015";
        sha256 = "0kkql31mc46lghl2qyirk5vl6l0ij24cb5q9d23zm7bkfm05rmzx";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "num-bigint";
            packageId = "num-bigint 0.2.2 (registry+https://github.com/rust-lang/crates.io-index)";
            optional = true;
            usesDefaultFeatures = false;
          }
          {
            name = "num-complex";
            packageId = "num-complex 0.2.3 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
          {
            name = "num-integer";
            packageId = "num-integer 0.1.41 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
          {
            name = "num-iter";
            packageId = "num-iter 0.1.39 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
          {
            name = "num-rational";
            packageId = "num-rational 0.2.2 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
          {
            name = "num-traits";
            packageId = "num-traits 0.2.8 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "std" ];
          "i128" = [ "num-bigint/i128" "num-complex/i128" "num-integer/i128" "num-iter/i128" "num-rational/i128" "num-traits/i128" ];
          "rand" = [ "num-bigint/rand" "num-complex/rand" ];
          "serde" = [ "num-bigint/serde" "num-complex/serde" "num-rational/serde" ];
          "std" = [ "num-bigint/std" "num-complex/std" "num-integer/std" "num-iter/std" "num-rational/std" "num-rational/bigint" "num-traits/std" ];
        };
        resolvedDefaultFeatures = [ "default" "num-bigint" "std" ];
      };
    "num-bigint 0.2.2 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "num-bigint";
        version = "0.2.2";
        edition = "2015";
        sha256 = "0alza0afrwvhiilqvjazkxv94sir14jqfi50cpv40rgjl1rk7xf6";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "num-integer";
            packageId = "num-integer 0.1.41 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
          {
            name = "num-traits";
            packageId = "num-traits 0.2.8 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "std" ];
          "i128" = [ "num-integer/i128" "num-traits/i128" ];
          "std" = [ "num-integer/std" "num-traits/std" ];
        };
        resolvedDefaultFeatures = [ "std" ];
      };
    "num-complex 0.2.3 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "num-complex";
        version = "0.2.3";
        edition = "2015";
        sha256 = "1l8gwn4cqhx77wzhzslwxhryrr5h4vsv19ys8wr5xb1g332805m9";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "num-traits";
            packageId = "num-traits 0.2.8 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
        ];
        buildDependencies = [
          {
            name = "autocfg";
            packageId = "autocfg 0.1.5 (registry+https://github.com/rust-lang/crates.io-index)";
          }
        ];
        features = {
          "default" = [ "std" ];
          "i128" = [ "num-traits/i128" ];
          "std" = [ "num-traits/std" ];
        };
        resolvedDefaultFeatures = [ "std" ];
      };
    "num-integer 0.1.41 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "num-integer";
        version = "0.1.41";
        edition = "2015";
        sha256 = "1y45nh9xlp2dra9svb1wfsy65fysm3k1w4m8jynywccq645yixid";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "num-traits";
            packageId = "num-traits 0.2.8 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
        ];
        buildDependencies = [
          {
            name = "autocfg";
            packageId = "autocfg 0.1.5 (registry+https://github.com/rust-lang/crates.io-index)";
          }
        ];
        features = {
          "default" = [ "std" ];
          "i128" = [ "num-traits/i128" ];
          "std" = [ "num-traits/std" ];
        };
        resolvedDefaultFeatures = [ "std" ];
      };
    "num-iter 0.1.39 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "num-iter";
        version = "0.1.39";
        edition = "2015";
        sha256 = "003j2hysdrkia435vxn38s1qs8cllrgk04l4aapb8hd0wci109mj";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "num-integer";
            packageId = "num-integer 0.1.41 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
          {
            name = "num-traits";
            packageId = "num-traits 0.2.8 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
        ];
        buildDependencies = [
          {
            name = "autocfg";
            packageId = "autocfg 0.1.5 (registry+https://github.com/rust-lang/crates.io-index)";
          }
        ];
        features = {
          "default" = [ "std" ];
          "i128" = [ "num-integer/i128" "num-traits/i128" ];
          "std" = [ "num-integer/std" "num-traits/std" ];
        };
        resolvedDefaultFeatures = [ "std" ];
      };
    "num-rational 0.2.2 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "num-rational";
        version = "0.2.2";
        edition = "2015";
        sha256 = "0igg7jnhsxffy3qdvq30pv5h58a9a20h43s4qpxviyzi5zmzqsx2";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "num-bigint";
            packageId = "num-bigint 0.2.2 (registry+https://github.com/rust-lang/crates.io-index)";
            optional = true;
            usesDefaultFeatures = false;
          }
          {
            name = "num-integer";
            packageId = "num-integer 0.1.41 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
          {
            name = "num-traits";
            packageId = "num-traits 0.2.8 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
        ];
        buildDependencies = [
          {
            name = "autocfg";
            packageId = "autocfg 0.1.5 (registry+https://github.com/rust-lang/crates.io-index)";
          }
        ];
        features = {
          "bigint" = [ "num-bigint" ];
          "bigint-std" = [ "bigint" "num-bigint/std" ];
          "default" = [ "bigint-std" "std" ];
          "i128" = [ "num-integer/i128" "num-traits/i128" ];
          "std" = [ "num-integer/std" "num-traits/std" ];
        };
        resolvedDefaultFeatures = [ "bigint" "num-bigint" "std" ];
      };
    "num-traits 0.2.8 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "num-traits";
        version = "0.2.8";
        edition = "2015";
        sha256 = "1mnlmy35n734n9xlq0qkfbgzz33x09a1s4rfj30p1976p09b862v";
        authors = [
          "The Rust Project Developers"
        ];
        buildDependencies = [
          {
            name = "autocfg";
            packageId = "autocfg 0.1.5 (registry+https://github.com/rust-lang/crates.io-index)";
          }
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "std" ];
      };
    "numtest 0.1.0 (path+file:///home/peter/projects/crate2nix/sample_projects/numtest)"
      = rec {
        crateName = "numtest";
        version = "0.1.0";
        edition = "2018";
        crateBin = [
          { name = "numtest"; path = "src/main.rs"; }
        ];
        src = (builtins.filterSource sourceFilter ./.);
        authors = [
          "Peter Kolloch <info@eigenvalue.net>"
        ];
        dependencies = [
          {
            name = "num";
            packageId = "num 0.2.0 (registry+https://github.com/rust-lang/crates.io-index)";
          }
        ];
        features = {
        };
      };
  };

  #
  # crate2nix/default.nix (excerpt start)
  # 

  # Target (platform) data for conditional dependencies.
  # This corresponds roughly to what buildRustCrate is setting.
  target = {
      unix = true;
      windows = false;
      fuchsia = true;
      # We don't support tests yet, so this is true for now.
      test = false;

      # This doesn't appear to be officially documented anywhere yet.
      # See https://github.com/rust-lang-nursery/rust-forge/issues/101.
      os = if stdenv.hostPlatform.isDarwin
        then "macos"
        else stdenv.hostPlatform.parsed.kernel.name;
      arch = stdenv.hostPlatform.parsed.cpu.name;
      family = "unix";
      env = "gnu";
      endian = if stdenv.hostPlatform.parsed.cpu.significantByte.name == "littleEndian" then "little" else "big";
      pointer_width = toString stdenv.hostPlatform.parsed.cpu.bits;
      vendor = stdenv.hostPlatform.parsed.vendor.name;
      debug_assertions = false;
  };

  /* Filters common temp files and build files */
  # TODO(pkolloch): Substitute with gitignore filter
  sourceFilter = name: type:
    let baseName = builtins.baseNameOf (builtins.toString name);
    in ! (
      # Filter out git
      baseName == ".gitignore" ||
      (type == "directory" && baseName == ".git" ) ||

      # Filter out build results
      (type == "directory" && (
        baseName == "target" ||
        baseName == "_site" ||
        baseName == ".sass-cache" ||
        baseName == ".jekyll-metadata" ||
        baseName == "build-artifacts"
        )) ||

      # Filter out nix-build result symlinks
      (type == "symlink" && lib.hasPrefix "result" baseName) ||

      # Filter out IDE config
      (type == "directory" && (
        baseName == ".idea" ||
        baseName == ".vscode"
        )) ||
      lib.hasSuffix ".iml" baseName ||

      # Filter out nix build files
      # lib.hasSuffix ".nix" baseName ||
      baseName == "Cargo.nix" ||

      # Filter out editor backup / swap files.
      lib.hasSuffix "~" baseName ||
      builtins.match "^\\.sw[a-z]$$" baseName != null ||
      builtins.match "^\\..*\\.sw[a-z]$$" baseName != null ||
      lib.hasSuffix ".tmp" baseName ||
      lib.hasSuffix ".bak" baseName ||
      baseName == "tests.nix"
    );

  /* A restricted overridable version of  buildRustCrateWithFeaturesImpl. */
  buildRustCrateWithFeatures = {
        packageId, 
        features ? rootFeatures,
        crateOverrides ? defaultCrateOverrides, 
        buildRustCrateFunc ? buildRustCrate
      }:
    lib.makeOverridable
      ({features, crateOverrides}: 
        let builtRustCrates = builtRustCratesWithFeatures {
          inherit packageId features crateOverrides  buildRustCrateFunc;
        };
        in builtRustCrates.${packageId})
      { inherit features crateOverrides; };

  /* Returns a buildRustCrate derivation for the given packageId and features. */
  builtRustCratesWithFeatures = { 
        crateConfigs? crates, 
        packageId,
        features,
        crateOverrides, 
        buildRustCrateFunc
      } @ args:
    assert (builtins.isAttrs crateConfigs);
    assert (builtins.isString packageId);
    assert (builtins.isList features);

    let mergedFeatures = mergePackageFeatures args;
        # Memoize built packages so that reappearing packages are only built once.
        builtByPackageId =
          lib.mapAttrs (packageId: value: buildByPackageId packageId) crateConfigs;
        buildByPackageId = packageId:
          let features = mergedFeatures."${packageId}" or [];
              crateConfig = lib.filterAttrs (n: v: n != "resolvedDefaultFeatures") crateConfigs."${packageId}";
              dependencies =
                dependencyDerivations builtByPackageId features (crateConfig.dependencies or []);
              buildDependencies =
                dependencyDerivations builtByPackageId features (crateConfig.buildDependencies or []);
              dependenciesWithRenames =
                lib.filter (d: d ? "rename")
                  (crateConfig.buildDependencies or [] ++ crateConfig.dependencies or []);
              crateRenames =
                builtins.listToAttrs (map (d: { name = d.name; value = d.rename; }) dependenciesWithRenames);
          in buildRustCrateFunc (crateConfig // { 
            inherit features dependencies buildDependencies crateRenames; 
          });
    in builtByPackageId;

  /* Returns the actual derivations for the given dependencies. */
  dependencyDerivations = builtByPackageId: features: dependencies:
    assert (builtins.isAttrs builtByPackageId);
    assert (builtins.isList features);
    assert (builtins.isList dependencies);

    let enabledDependencies = filterEnabledDependencies dependencies features;
        depDerivation = dependency: builtByPackageId.${dependency.packageId};
    in map depDerivation enabledDependencies;

  sanitizeForJson = val:
          if builtins.isAttrs val
          then lib.mapAttrs (n: v: sanitizeForJson v) val
          else if builtins.isList val
          then builtins.map sanitizeForJson val
          else if builtins.isFunction val
          then "function"
          else val;

  debugCrate = {packageId}:
    assert (builtins.isString packageId);

    rec {
        # The built tree as passed to buildRustCrate.
        buildTree = buildRustCrateWithFeatures {
            buildRustCrateFunc = lib.id;
            inherit packageId;
        };
        sanitizedBuildTree = sanitizeForJson buildTree;
        dependencyTree = sanitizeForJson (buildRustCrateWithFeatures {
            buildRustCrateFunc = crate: {
                "01_crateName" = crate.crateName or false;
                "02_features" = crate.features or [];
                "03_dependencies" = crate.dependencies or [];
            };
            inherit packageId;
        });
        mergedPackageFeatures = mergePackageFeatures { inherit packageId; features = rootFeatures; };
        diffedDefaultPackageFeatures = diffDefaultPackageFeatures { inherit packageId;  features = rootFeatures; };
    };

  /* Returns differences between cargo default features and crate2nix default features.
   *
   * This is useful for verifying the feature resolution in crate2nix.
   */
  diffDefaultPackageFeatures = {crateConfigs ? crates, packageId}:
    assert (builtins.isAttrs crateConfigs);

    let prefixValues = prefix: lib.mapAttrs (n: v: { "${prefix}" = v; });
        mergedFeatures =
          prefixValues
            "crate2nix"
            (mergePackageFeatures {inherit crateConfigs packageId; features = ["default"]; });
        configs = prefixValues "cargo" crateConfigs;
        combined = lib.foldAttrs (a: b: a // b) {} [ mergedFeatures configs ];
        onlyInCargo = builtins.attrNames (lib.filterAttrs (n: v: !(v ? "crate2nix" ) && (v ? "cargo")) combined);
        onlyInCrate2Nix = builtins.attrNames (lib.filterAttrs (n: v: (v ? "crate2nix" ) && !(v ? "cargo")) combined);
        differentFeatures = lib.filterAttrs
          (n: v:
          (v ? "crate2nix" )
          && (v ? "cargo")
          && (v.crate2nix.features or []) != (v."cargo".resolved_default_features or []))
          combined;
    in builtins.toJSON { inherit onlyInCargo onlyInCrate2Nix differentFeatures; };

  /* Returns the feature configuration by package id for the given input crate.

     Returns a { packageId, features } attribute set for every package needed for building the
     package for the given packageId with the given features.

     Returns multiple, potentially conflicting attribute sets for dependencies that are reachable
     by multiple paths in the dependency tree.
  */
  mergePackageFeatures = {
    crateConfigs ? crates,
    packageId,
    features ? rootFeatures,
    dependencyPath? [crates.${packageId}.crateName],
    featuresByPackageId? {},
    ...} @ args:
    assert (builtins.isAttrs crateConfigs);
    assert (builtins.isString packageId);
    assert (builtins.isList features);
    assert (builtins.isAttrs featuresByPackageId);

    let
        crateConfig = crateConfigs."${packageId}" or (builtins.throw "Package not found: ${packageId}");
        expandedFeatures = expandFeatures (crateConfig.features or {}) features;

        depWithResolvedFeatures = dependency:
          let packageId = dependency.packageId;
              features = dependencyFeatures expandedFeatures dependency;
          in { inherit packageId features; };

        resolveDependencies = cache: path: dependencies:
          assert (builtins.isAttrs cache);
          assert (builtins.isList dependencies);

          let enabledDependencies = filterEnabledDependencies dependencies expandedFeatures;
              directDependencies = map depWithResolvedFeatures enabledDependencies;
              foldOverCache = op: lib.foldl op cache directDependencies;
          in foldOverCache
            (cache: {packageId, features}:
             let cacheFeatures = cache.${packageId} or [];
                 combinedFeatures = sortedUnique (cacheFeatures ++ features);
             in
             if cache ? ${packageId} && cache.${packageId} == combinedFeatures
             then cache
             else mergePackageFeatures {
                  # This is purely for debugging.
                  dependencyPath = dependencyPath ++ [path crateConfigs.${packageId}.crateName];
                  features = combinedFeatures;
                  featuresByPackageId = cache;
                  inherit crateConfigs packageId;
                 });

        cacheWithSelf =
            let cacheFeatures = featuresByPackageId.${packageId} or [];
                combinedFeatures = sortedUnique (cacheFeatures ++ expandedFeatures);
            in featuresByPackageId // {
                ${packageId} = combinedFeatures;
            };

        cacheWithDependencies =
            resolveDependencies cacheWithSelf "dep" (crateConfig.dependencies or []);
        cacheWithAll =
            resolveDependencies cacheWithDependencies "build" (crateConfig.buildDependencies or []);

    in cacheWithAll;

  /* Returns the enabled dependencies given the enabled features. */
  filterEnabledDependencies = dependencies: features:
    assert (builtins.isList dependencies);
    assert (builtins.isList features);

    lib.filter
      (dep:
        let targetFunc = dep.target or (features: true);
        in targetFunc features
           && (!(dep.optional or false) || builtins.any (doesFeatureEnableDependency dep.name) features))
      dependencies;

  /* Returns whether the given feature should enable the given dependency. */
  doesFeatureEnableDependency = depName: feature:
    let prefix = "${depName}/";
        len = builtins.stringLength prefix;
        startsWithPrefix = builtins.substring 0 len feature == prefix;
    in feature == depName || startsWithPrefix;

  /* Returns the expanded features for the given inputFeatures by applying the rules in featureMap.

     featureMap is an attribute set which maps feature names to lists of further feature names to enable in case this
     feature is selected.
  */
  expandFeatures = featureMap: inputFeatures:
    assert (builtins.isAttrs featureMap);
    assert (builtins.isList inputFeatures);

    let expandFeature = feature:
          assert (builtins.isString feature);
          [feature] ++ (expandFeatures featureMap (featureMap."${feature}" or []));
        outFeatures = builtins.concatMap expandFeature inputFeatures;
    in sortedUnique outFeatures;

  /*
   * Returns the actual dependencies for the given dependency.
   *
   * features: The features of the crate that refers this dependency.
   */
  dependencyFeatures = features: dependency:
    assert (builtins.isList features);
    assert (builtins.isAttrs dependency);

    let defaultOrNil = if dependency.usesDefaultFeatures or true
                       then ["default"]
                       else [];
        explicitFeatures = dependency.features or [];
        additionalDependencyFeatures =
          let dependencyPrefix = dependency.name+"/";
              dependencyFeatures =
                builtins.filter (f: lib.hasPrefix dependencyPrefix f) features;
          in builtins.map (lib.removePrefix dependencyPrefix) dependencyFeatures;
    in
      defaultOrNil ++ explicitFeatures ++ additionalDependencyFeatures;

  /* Sorts and removes duplicates from a list of strings. */
  sortedUnique = features:
    assert (builtins.isList features);
    assert (builtins.all builtins.isString features);

    let outFeaturesSet = lib.foldl (set: feature: set // {"${feature}" = 1;} ) {} features;
        outFeaturesUnique = builtins.attrNames outFeaturesSet;
    in builtins.sort (a: b: a < b) outFeaturesUnique;

  #
  # crate2nix/default.nix (excerpt end)
  # 

}
