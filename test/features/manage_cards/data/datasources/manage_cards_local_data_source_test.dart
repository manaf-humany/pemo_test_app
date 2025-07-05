import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pemo_test_project/core/core.dart';
import 'package:pemo_test_project/features/manage_cards/manage_cards.dart';

/// A mock implementation of [HiveInterface] for testing purposes.
class MockHiveInterface extends Mock implements HiveInterface {}

/// A mock implementation of [Box<CardModel>] for testing purposes.
class MockHiveBox extends Mock implements Box<CardModel> {}

/// A fake implementation of [CardModel] for testing purposes.
/// This is used with `registerFallbackValue` for mocktail.
class FakeCardModel extends Fake implements CardModel {}

/// Main function for running tests for [ManageCardsLocalDataSourceImpl].
void main() {
  late ManageCardsLocalDataSourceImpl dataSource;
  late MockHiveInterface mockHive;
  late MockHiveBox mockBox;

  setUpAll(() {
    registerFallbackValue(
      FakeCardModel(),
    );
  });

  setUp(() {
    mockHive = MockHiveInterface();
    mockBox = MockHiveBox();
    dataSource = ManageCardsLocalDataSourceImpl(hive: mockHive);

    // Stub the box opening behavior
    when(() => mockHive.openBox<CardModel>(any()))
        .thenAnswer((_) async => mockBox);
    when(() => mockHive.isBoxOpen(any())).thenReturn(true);
    when(() => mockHive.box<CardModel>(any())).thenReturn(mockBox);
  });

  final tCardModel = const CardModel(
    id: '1',
    cardName: 'My Debit Card',
    cardholderName: 'John Doe',
    balance: 5000,
    cardColor: 0xFF000000,
  );

  /// Test group for the [ManageCardsLocalDataSourceImpl.getCards] method.
  group('getCards', () {
    test('should return a list of CardModel from the box when successful',
        () async {
      // Arrange
      when(() => mockBox.values).thenReturn([tCardModel]);

      // Act
      final result = await dataSource.getCards();

      // Assert
      expect(result, [tCardModel]);
      verify(() => mockBox.values).called(1);
    });

    test('should throw a CacheException when Hive fails to retrieve cards',
        () async {
      // Arrange
      when(() => mockBox.values).thenThrow(Exception('Hive error'));

      // Act
      final call = dataSource.getCards;

      // Assert
      expect(() => call(), throwsA(isA<CacheException>()));
    });
  });

  /// Test group for the [ManageCardsLocalDataSourceImpl.cacheCard] method.
  group('cacheCard', () {
    test('should successfully cache a card', () async {
      // Arrange
      when(() => mockBox.put(any(), any())).thenAnswer((_) async => {});

      // Act
      await dataSource.cacheCard(tCardModel);

      // Assert
      verify(() => mockBox.put(tCardModel.id, tCardModel)).called(1);
    });

    test('should throw a CacheException when Hive fails to cache a card',
        () async {
      // Arrange
      when(() => mockBox.put(any(), any())).thenThrow(Exception('Hive error'));

      // Act
      final call = dataSource.cacheCard;

      // Assert
      expect(() => call(tCardModel), throwsA(isA<CacheException>()));
    });
  });

  /// Test group for the [ManageCardsLocalDataSourceImpl.createCard] method.
  group('createCard', () {
    test('should successfully create and cache a card', () async {
      // Arrange
      when(() => mockBox.put(any(), any())).thenAnswer((_) async => {});

      // Act
      await dataSource.createCard(tCardModel);

      // Assert
      verify(() => mockBox.put(tCardModel.id, tCardModel)).called(1);
    });

    test('should throw a CacheException when Hive fails to create a card',
        () async {
      // Arrange
      when(() => mockBox.put(any(), any())).thenThrow(Exception('Hive error'));

      // Act
      final call = dataSource.createCard;

      // Assert
      expect(() => call(tCardModel), throwsA(isA<CacheException>()));
    });
  });
}
