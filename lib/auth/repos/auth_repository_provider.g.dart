// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'19a3485653561ac2f781b997131430c5659286d1';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
String _$authStateStreamHash() => r'21e813fdefad80f26d5eb53e54bf5851a3a9382d';

/// See also [authStateStream].
@ProviderFor(authStateStream)
final authStateStreamProvider = AutoDisposeStreamProvider<User?>.internal(
  authStateStream,
  name: r'authStateStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authStateStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStateStreamRef = AutoDisposeStreamProviderRef<User?>;
String _$userInfoHash() => r'615bc93eacc60b20abe59b8cb1355edf24f9b6aa';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [userInfo].
@ProviderFor(userInfo)
const userInfoProvider = UserInfoFamily();

/// See also [userInfo].
class UserInfoFamily extends Family<AsyncValue<AppUserModel>> {
  /// See also [userInfo].
  const UserInfoFamily();

  /// See also [userInfo].
  UserInfoProvider call(String uid) {
    return UserInfoProvider(uid);
  }

  @override
  UserInfoProvider getProviderOverride(covariant UserInfoProvider provider) {
    return call(provider.uid);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userInfoProvider';
}

/// See also [userInfo].
class UserInfoProvider extends AutoDisposeFutureProvider<AppUserModel> {
  /// See also [userInfo].
  UserInfoProvider(String uid)
    : this._internal(
        (ref) => userInfo(ref as UserInfoRef, uid),
        from: userInfoProvider,
        name: r'userInfoProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$userInfoHash,
        dependencies: UserInfoFamily._dependencies,
        allTransitiveDependencies: UserInfoFamily._allTransitiveDependencies,
        uid: uid,
      );

  UserInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  Override overrideWith(
    FutureOr<AppUserModel> Function(UserInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserInfoProvider._internal(
        (ref) => create(ref as UserInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AppUserModel> createElement() {
    return _UserInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserInfoProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserInfoRef on AutoDisposeFutureProviderRef<AppUserModel> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _UserInfoProviderElement
    extends AutoDisposeFutureProviderElement<AppUserModel>
    with UserInfoRef {
  _UserInfoProviderElement(super.provider);

  @override
  String get uid => (origin as UserInfoProvider).uid;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
