unit UST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus, Grids, DBGridEh;

type
  TSt_Form = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    ADOQSt: TADOQuery;
    ADOQStPROD_CODE: TStringField;
    ADOQStPRODUCT_NAME: TStringField;
    ADOQStUNIT_NAME: TStringField;
    ADOQStLOCATION: TStringField;
    ADOQStqty_on_hand: TBCDField;
    ADOQStPRODUCT_GROUP_NAME: TStringField;
    ADOQStqty_onhand: TBCDField;
    ADOQStPRODUCT_DESC: TStringField;
    ADOQStDEPT_CODE: TStringField;
    ADOQStDEPT_NAME: TStringField;
    ADOQStTTYPe: TStringField;
    ADOQStremark: TStringField;
    Label2: TLabel;
    Edit2: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADOQStBeforeDelete(DataSet: TDataSet);
    procedure ADOQStBeforeEdit(DataSet: TDataSet);
    procedure ADOQStBeforeInsert(DataSet: TDataSet);
    procedure Edit2Change(Sender: TObject);
  private
   PreColumn: TColumnEh;
      field_name:string;
      procedure init;
      procedure item_click(sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  St_Form: TSt_Form;

implementation

uses udm,common;

{$R *.dfm}

procedure TSt_Form.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TSt_Form.BitBtn2Click(Sender: TObject);
begin
if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh1,'出仓信息') ;

end;

procedure TSt_Form.BitBtn5Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TSt_Form.DBGridEh1TitleClick(Column: TColumnEh);
begin
if column.Title.SortMarker =smDownEh then
 begin
   column.Title.SortMarker:=smUpEh;
   ADOQSt.Sort:=Column.FieldName;
 end
 else
 begin
   column.Title.SortMarker:=smDownEh;
   ADOQSt.Sort:=Column.FieldName+' DESC';
 end;
 if (PreColumn.FieldName<>column.FieldName) and (column.Field.DataType in [ftString,ftWideString]) then
  begin
    self.field_name:=column.FieldName;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    label2.Caption := column.Title.Caption;
    PreColumn := column;
  end
  else
  Edit2.SetFocus;
end;

procedure TSt_Form.FormCreate(Sender: TObject);
begin
init;
end;

procedure TSt_Form.init;
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
end;


procedure TSt_Form.FormShow(Sender: TObject);
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

procedure TSt_Form.item_click(sender: TObject);
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

procedure TSt_Form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='V') and (ssalt in shift) then
 showmessage(ADOQSt.SQL.Text);
 if (ssCtrl in shift) and (key=46) then  abort;
 if (key=45) then abort;      //insert键
end;

procedure TSt_Form.ADOQStBeforeDelete(DataSet: TDataSet);
begin
Abort;
end;

procedure TSt_Form.ADOQStBeforeEdit(DataSet: TDataSet);
begin
  if (StrToInt(vprev) = 1) or (StrToInt(vprev) = 3) then
  begin
    MessageDlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Abort;
  end;
end;

procedure TSt_Form.ADOQStBeforeInsert(DataSet: TDataSet);
begin
Abort;
end;



procedure TSt_Form.Edit2Change(Sender: TObject);
begin
 if trim(Edit2.text)<>'' then
  ADOQSt.Filter := self.field_name+' like ''%'+trim(edit2.Text)+'%'''
 else
  ADOQSt.Filter := '';
end;

end.
