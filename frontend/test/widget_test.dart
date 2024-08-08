import 'package:flutter_test/flutter_test.dart';
import 'package:realtime_stock_watchlist/main.dart'; // Import main.dart from lib directory
import 'package:realtime_stock_watchlist/pages/add_stock.dart'; // Import AddStockPage
import 'package:realtime_stock_watchlist/pages/stock_list.dart'; // Import StockListPage

void main() {
  testWidgets('HomePage has buttons to navigate to AddStockPage and StockListPage', (WidgetTester tester) async {
    // Build the MyApp widget and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the HomePage contains the expected buttons.
    expect(find.text('Add Stock'), findsOneWidget);
    expect(find.text('View Stock List'), findsOneWidget);

    // Tap on the 'Add Stock' button and trigger a frame.
    await tester.tap(find.text('Add Stock'));
    await tester.pumpAndSettle();

    // Verify that navigation happened by checking if 'AddStockPage' is present.
    expect(find.byType(AddStockPage), findsOneWidget);

    // Go back to the home page.
    await tester.pageBack();
    await tester.pumpAndSettle();

    // Tap on the 'View Stock List' button and trigger a frame.
    await tester.tap(find.text('View Stock List'));
    await tester.pumpAndSettle();

    // Verify that navigation happened by checking if 'StockListPage' is present.
    expect(find.byType(StockListPage), findsOneWidget);
  });
}
