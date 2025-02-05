import InlineSnapshotTesting
import TestCases
import XCTest

@MainActor
final class IdentifiedListTests: BaseIntegrationTests {
  override func setUp() {
    super.setUp()
    self.app.buttons["iOS 16"].tap()
    self.app.buttons["Identified list"].tap()
    self.clearLogs()
    //SnapshotTesting.isRecording = true
  }

  func testBasics() {
    self.app.buttons["Add"].tap()
    self.assertLogs {
      """
      BasicsView.body
      IdentifiedListView.body
      IdentifiedListView.body.ForEachStore
      IdentifiedListView.body.ForEachStore
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.deinit
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.deinit
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.init
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.init
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.scope
      Store<UUID, Action>
      Store<UUID, BasicsView.Feature.Action>.deinit
      Store<UUID, BasicsView.Feature.Action>.deinit
      Store<UUID, BasicsView.Feature.Action>.init
      Store<UUID, BasicsView.Feature.Action>.init
      Store<UUID, BasicsView.Feature.Action>.init
      Store<UUID, BasicsView.Feature.Action>.init
      StoreOf<BasicsView.Feature>.deinit
      StoreOf<BasicsView.Feature>.init
      StoreOf<BasicsView.Feature>.init
      StoreOf<BasicsView.Feature>.init
      StoreOf<IdentifiedListView.Feature>.scope
      StoreOf<IdentifiedListView.Feature>.scope
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.deinit
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.init
      ViewStore<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.deinit
      ViewStore<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.deinit
      ViewStore<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.init
      ViewStore<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.init
      ViewStore<IdentifiedListView.ViewState, IdentifiedListView.Feature.Action>.deinit
      ViewStore<IdentifiedListView.ViewState, IdentifiedListView.Feature.Action>.init
      ViewStore<UUID, BasicsView.Feature.Action>.deinit
      ViewStore<UUID, BasicsView.Feature.Action>.init
      ViewStore<UUID, BasicsView.Feature.Action>.init
      ViewStore<UUID, BasicsView.Feature.Action>.init
      ViewStoreOf<BasicsView.Feature>.init
      WithStore<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.body
      WithStore<IdentifiedListView.ViewState, IdentifiedListView.Feature.Action>.body
      WithStore<UUID, BasicsView.Feature.Action>.body
      WithStoreOf<BasicsView.Feature>.body
      """
    }
  }

  func testAddTwoIncrementFirst() {
    self.app.buttons["Add"].tap()
    self.app.buttons["Add"].tap()
    self.clearLogs()
    self.app.buttons["Increment"].firstMatch.tap()
    XCTAssertEqual(self.app.staticTexts["Count: 1"].exists, true)
    self.assertLogs {
      """
      BasicsView.body
      BasicsView.body
      BasicsView.body
      IdentifiedListView.body
      IdentifiedListView.body.ForEachStore
      IdentifiedListView.body.ForEachStore
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.deinit
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.init
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.init
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.scope
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.scope
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.scope
      Store<UUID, Action>
      Store<UUID, Action>
      Store<UUID, BasicsView.Feature.Action>.deinit
      Store<UUID, BasicsView.Feature.Action>.deinit
      Store<UUID, BasicsView.Feature.Action>.deinit
      Store<UUID, BasicsView.Feature.Action>.deinit
      Store<UUID, BasicsView.Feature.Action>.init
      Store<UUID, BasicsView.Feature.Action>.init
      Store<UUID, BasicsView.Feature.Action>.init
      Store<UUID, BasicsView.Feature.Action>.init
      Store<UUID, BasicsView.Feature.Action>.scope
      Store<UUID, BasicsView.Feature.Action>.scope
      StoreOf<BasicsView.Feature>.deinit
      StoreOf<BasicsView.Feature>.deinit
      StoreOf<BasicsView.Feature>.deinit
      StoreOf<BasicsView.Feature>.init
      StoreOf<BasicsView.Feature>.init
      StoreOf<BasicsView.Feature>.init
      StoreOf<BasicsView.Feature>.init
      StoreOf<BasicsView.Feature>.scope
      StoreOf<BasicsView.Feature>.scope
      StoreOf<BasicsView.Feature>.scope
      StoreOf<BasicsView.Feature>.scope
      StoreOf<IdentifiedListView.Feature>.scope
      StoreOf<IdentifiedListView.Feature>.scope
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.deinit
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.deinit
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.deinit
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.init
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.init
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.init
      ViewStore<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.deinit
      ViewStore<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.deinit
      ViewStore<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.init
      ViewStore<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.init
      ViewStore<IdentifiedListView.ViewState, IdentifiedListView.Feature.Action>.deinit
      ViewStore<IdentifiedListView.ViewState, IdentifiedListView.Feature.Action>.init
      ViewStore<UUID, BasicsView.Feature.Action>.deinit
      ViewStore<UUID, BasicsView.Feature.Action>.deinit
      ViewStore<UUID, BasicsView.Feature.Action>.deinit
      ViewStore<UUID, BasicsView.Feature.Action>.deinit
      ViewStore<UUID, BasicsView.Feature.Action>.init
      ViewStore<UUID, BasicsView.Feature.Action>.init
      ViewStore<UUID, BasicsView.Feature.Action>.init
      ViewStore<UUID, BasicsView.Feature.Action>.init
      ViewStoreOf<BasicsView.Feature>.deinit
      ViewStoreOf<BasicsView.Feature>.deinit
      ViewStoreOf<BasicsView.Feature>.init
      ViewStoreOf<BasicsView.Feature>.init
      WithStore<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.body
      WithStore<IdentifiedListView.ViewState, IdentifiedListView.Feature.Action>.body
      WithStore<UUID, BasicsView.Feature.Action>.body
      WithStore<UUID, BasicsView.Feature.Action>.body
      WithStoreOf<BasicsView.Feature>.body
      WithStoreOf<BasicsView.Feature>.body
      WithStoreOf<BasicsView.Feature>.body
      """
    }
  }

  func testAddTwoIncrementSecond() {
    self.app.buttons["Add"].tap()
    self.app.buttons["Add"].tap()
    self.clearLogs()
    self.app.cells.element(boundBy: 2).buttons["Increment"].tap()
    XCTAssertEqual(self.app.staticTexts["Count: 0"].exists, true)
    self.assertLogs {
      """
      BasicsView.body
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.scope
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.scope
      Store<IdentifiedArray<UUID, BasicsView.Feature.State>, (UUID, BasicsView.Feature.Action)>.scope
      Store<UUID, BasicsView.Feature.Action>.scope
      Store<UUID, BasicsView.Feature.Action>.scope
      StoreOf<BasicsView.Feature>.scope
      StoreOf<BasicsView.Feature>.scope
      StoreOf<BasicsView.Feature>.scope
      StoreOf<BasicsView.Feature>.scope
      StoreOf<IdentifiedListView.Feature>.scope
      StoreOf<IdentifiedListView.Feature>.scope
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.deinit
      ViewStore<BasicsView.Feature.State, BasicsView.Feature.Action>.init
      WithStoreOf<BasicsView.Feature>.body
      """
    }
  }
}
