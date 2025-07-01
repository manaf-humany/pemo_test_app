import 'package:hive/hive.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

/// An abstract interface for the local data source that manages cards.
///
/// This contract defines the methods for interacting with the local storage
/// ( Hive) for card-related data.
abstract class ManageCardsLocalDataSource {
  /// Retrieves a list of all cached cards.
  ///
  /// Returns a [Future] that completes with a list of [CardModel]s.
  /// Throws a [CacheException] if there is an error retrieving the data.
  Future<List<CardModel>> getCards();

  /// Caches a new card.
  ///
  /// Takes a [CardModel] to be saved.
  /// Returns a [Future] that completes when the operation is finished.
  /// Throws a [CacheException] if there is an error saving the data.
  Future<void> cacheCard(CardModel card);

  /// Creates a new card and saves it to the local database.
  /// Takes a [CardModel] to be saved.
  /// Returns a [Future] that completes when the operation is finished.
  /// Throws a [CacheException] if the operation fails.
  Future<void> createCard(CardModel card);
}

/// The key used to store the cards box in Hive.
const String kCardsBoxKey = 'cards_box';

/// The concrete implementation of [ManageCardsLocalDataSource] using Hive.
class ManageCardsLocalDataSourceImpl implements ManageCardsLocalDataSource {
  ManageCardsLocalDataSourceImpl({required this.hive});

  final HiveInterface hive;

  @override
  Future<List<CardModel>> getCards() async {
    try {
      final box = await _getCardsBox();
      return box.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCard(CardModel card) async {
    try {
      final box = await _getCardsBox();
      await box.put(card.id, card);
    } catch (e) {
      throw CacheException();
    }
  }

  /// Opens and returns the Hive box for cards.
  Future<Box<CardModel>> _getCardsBox() async {
    if (hive.isBoxOpen(kCardsBoxKey)) {
      return hive.box<CardModel>(kCardsBoxKey);
    }
    return hive.openBox<CardModel>(kCardsBoxKey);
  }

  @override
  Future<void> createCard(CardModel card) async {
    try {
      var box = await _getCardsBox();
      await box.put(card.id, card);
      return Future.value();
    } catch (e) {
      throw CacheException();
    }
  }
}
