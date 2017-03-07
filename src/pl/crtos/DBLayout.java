package pl.crtos;


import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;


class DBLayout extends Stage {

    private final static double WIDTH = 900;
    private final static double HEIGHT = 500;

    DBLayout(){
        setTitle("Database Manager");

        BorderPane borderPane = new BorderPane();
        VBox topContainer = new VBox(); //Creates a container to hold all Menu Objects.

        ToolBar toolbar = new ToolBar();
        HBox statusbar = new HBox();
        MenuBar menuBar = new MenuBar();
        Menu menuFile = new Menu("File");
        MenuItem menuItemFileNew = new MenuItem("New");
        menuFile.getItems().add(menuItemFileNew);

        Menu menuEdit = new Menu("Edit");
        MenuItem menuItemEditAdd = new MenuItem("Add");
        menuEdit.getItems().add(menuItemEditAdd);

        menuBar.getMenus().addAll(menuFile,menuEdit);

        topContainer.getChildren().addAll(menuBar,toolbar);
        borderPane.setTop(topContainer);
        borderPane.setBottom(statusbar);

        TabPane tabPane = new TabPane();
        for (int i = 0; i < 5; i++) {
            Tab tab = new Tab("Tab"+i);
            tabPane.getTabs().add(tab);
        }
        tabPane.setTabClosingPolicy(TabPane.TabClosingPolicy.UNAVAILABLE);

        TextArea textArea = new TextArea();
        textArea.setEditable(false);
        textArea.setDisable(true);

        textArea.setText("Text Are for details about players etc.");
        textArea.setPrefSize(WIDTH/3,getMaxHeight());
        borderPane.setRight(textArea);
        borderPane.setCenter(tabPane);

        Scene scene = new Scene(borderPane,WIDTH,HEIGHT);



        setScene(scene);
        show();
    }

}
