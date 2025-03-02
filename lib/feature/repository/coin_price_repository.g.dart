// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_price_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinbasePriceRepositoryHash() =>
    r'dc8e155c989a7a13175fd7aea963eaac0c09f2f7';

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

/// See also [coinbasePriceRepository].
@ProviderFor(coinbasePriceRepository)
const coinbasePriceRepositoryProvider = CoinbasePriceRepositoryFamily();

/// See also [coinbasePriceRepository].
class CoinbasePriceRepositoryFamily extends Family<AsyncValue> {
  /// See also [coinbasePriceRepository].
  const CoinbasePriceRepositoryFamily();

  /// See also [coinbasePriceRepository].
  CoinbasePriceRepositoryProvider call(
    List<String> productIds,
  ) {
    return CoinbasePriceRepositoryProvider(
      productIds,
    );
  }

  @override
  CoinbasePriceRepositoryProvider getProviderOverride(
    covariant CoinbasePriceRepositoryProvider provider,
  ) {
    return call(
      provider.productIds,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'coinbasePriceRepositoryProvider';
}

/// See also [coinbasePriceRepository].
class CoinbasePriceRepositoryProvider
    extends AutoDisposeStreamProvider<Object?> {
  /// See also [coinbasePriceRepository].
  CoinbasePriceRepositoryProvider(
    List<String> productIds,
  ) : this._internal(
          (ref) => coinbasePriceRepository(
            ref as CoinbasePriceRepositoryRef,
            productIds,
          ),
          from: coinbasePriceRepositoryProvider,
          name: r'coinbasePriceRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$coinbasePriceRepositoryHash,
          dependencies: CoinbasePriceRepositoryFamily._dependencies,
          allTransitiveDependencies:
              CoinbasePriceRepositoryFamily._allTransitiveDependencies,
          productIds: productIds,
        );

  CoinbasePriceRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productIds,
  }) : super.internal();

  final List<String> productIds;

  @override
  Override overrideWith(
    Stream Function(CoinbasePriceRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CoinbasePriceRepositoryProvider._internal(
        (ref) => create(ref as CoinbasePriceRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productIds: productIds,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Object?> createElement() {
    return _CoinbasePriceRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CoinbasePriceRepositoryProvider &&
        other.productIds == productIds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productIds.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CoinbasePriceRepositoryRef on AutoDisposeStreamProviderRef<Object?> {
  /// The parameter `productIds` of this provider.
  List<String> get productIds;
}

class _CoinbasePriceRepositoryProviderElement
    extends AutoDisposeStreamProviderElement<Object?>
    with CoinbasePriceRepositoryRef {
  _CoinbasePriceRepositoryProviderElement(super.provider);

  @override
  List<String> get productIds =>
      (origin as CoinbasePriceRepositoryProvider).productIds;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
