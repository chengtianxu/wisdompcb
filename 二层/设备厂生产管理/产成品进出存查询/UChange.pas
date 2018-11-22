unit UChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus;

type
  TfrmChange = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    ADOQChange: TADOQuery;
    PopupMenu1: TPopupMenu;
    ADOQChangeTDATE: TDateTimeField;
    ADOQChangeEMPLOYEE_NAME: TStringField;
    ADOQChangePROD_CODE: TStringField;
    ADOQChangePRODUCT_NAME: TStringField;
    ADOQChangePRODUCT_DESC: TStringField;
    ADOQChangeCODE: TStringField;
    ADOQChangeLOCATION: TStringField;
    ADOQChangePROD_CODE_N: TStringField;
    ADOQChangePRODUCT_NAME_N: TStringField;
    ADOQChangePRODUCT_DESC_N: TStringField;
    ADOQChangeCODE_N: TStringField;
    ADOQChangeLOCATION_N: TStringField;
    ADOQChangeQUANTITY: TFloatField;
    ADOQChangeEMPL_CODE: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
        PreColumn: TColumnEh;
      field_name:string;
      sSql :string;
      procedure init;
      procedure item_click(sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChange: TfrmChange;

implementation

uses udm,common;

{$R *.dfm}

procedure TfrmChange.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TfrmChange.BitBtn2Click(Sender: TObject);
begin
if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh1,'×ªÒÆÐÅÏ¢') ;

end;

procedure TfrmChange.BitBtn5Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmChange.DBGridEh1TitleClick(Column: TColumnEh);
begin
if column.Title.SortMarker =smDownEh then
begin
   column.Title.SortMarker:=smUpEh;
   ADOQChange.Sort:=Column.FieldName;
end
else
begin
   column.Title.SortMarker:=smDownEh;
   ADOQChange.Sort:=Column.FieldName+' DESC';
end;
if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
 begin
    self.field_name:=column.FieldName;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end;
end;

procedure TfrmChange.FormCreate(Sender: TObject);
begin
init;
end;

procedure TfrmChange.init;
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
end;

procedure TfrmChange.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
if dm.ADOConnection1.Connected then
  begin
 DBGridEh1TitleClick(PreColumn);
  for i:=1 to DBGridEh1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;

    if DBGridEh1.Columns[i-1].Visible then
        item.Checked := true ;
        item.OnClick := item_click ;
        PopupMenu1.Items.Add(item) ;
   end;
 end;
end;

procedure TfrmChange.item_click(sender: TObject);
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

procedure TfrmChange.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(ADOQChange.SQL.Text);
end;

end.
