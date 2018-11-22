unit UWZCX22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DBGrids, ComCtrls, common,
  Menus,ComObj,DB;

type
  Tmain_form = class(TForm)
    pnl1: TPanel;
    btn3: TBitBtn;
    btn4: TBitBtn;
    btn5: TBitBtn;
    stat1: TStatusBar;
    pm1: TPopupMenu;
    DBGridEh1: TDBGridEh;
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
      PreColumn: TColumnEh;
      field_name:string;
      procedure item_click(sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main_form: Tmain_form;

implementation

uses Udm, Uqty;

{$R *.dfm}

procedure Tmain_form.btn3Click(Sender: TObject);
begin
dm.qry1.Close;
close;
end;

procedure Tmain_form.btn4Click(Sender: TObject);
begin
if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption) ;
end;

procedure Tmain_form.btn5Click(Sender: TObject);
begin
     pm1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure Tmain_form.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
    if dm.con1.Connected then
    begin
        DBGridEh1TitleClick(PreColumn);
        for i:=1 to DBGridEh1.Columns.Count do
        begin
            item := TmenuItem.Create(self) ;
            item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;

            if DBGridEh1.Columns[i-1].Visible then
                item.Checked := true ;
                item.OnClick := item_click ;
                pm1.Items.Add(item) ;
        end;
     end;
end;

procedure Tmain_form.DBGridEh1TitleClick(Column: TColumnEh);
begin
    if column.Title.SortMarker =smDownEh then
    begin
       column.Title.SortMarker:=smUpEh;
       dm.qry1.Sort:=Column.FieldName;
    end
    else
    begin
       column.Title.SortMarker:=smDownEh;
       dm.qry1.Sort:=Column.FieldName+' DESC';
    end;
    if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
     begin
        self.field_name:=column.FieldName;
        PreColumn.Title.Color := clBtnFace;
        Column.Title.Color := clred;
        PreColumn := column;
      end;
end;

procedure Tmain_form.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := true ;
                      break ;
                  end ;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false ;
                      break ;
                  end ;
      end ;
end;

procedure Tmain_form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.qry1.SQL.Text);
end;

end.
