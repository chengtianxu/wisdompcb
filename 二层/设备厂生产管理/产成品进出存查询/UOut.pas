unit UOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Menus
  ;

type
  TFormOut = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    Edit2: TEdit;
    DataSource1: TDataSource;
    ADOQOut: TADOQuery;
    PopupMenu1: TPopupMenu;
    ADOQOutLOCATION: TStringField;
    ADOQOutPROD_CODE: TStringField;
    ADOQOutPRODUCT_NAME: TStringField;
    ADOQOutPRODUCT_GROUP_NAME: TStringField;
    ADOQOutsales_order: TStringField;
    ADOQOutsales_date: TDateTimeField;
    ADOQOutCUSTOMER_NAME: TStringField;
    ADOQOutship_method: TStringField;
    ADOQOutexch_rate: TBCDField;
    ADOQOutpay_method: TStringField;
    ADOQOutquantity: TBCDField;
    ADOQOuttax_rate: TBCDField;
    ADOQOutCURR_NAME: TStringField;
    ADOQOutprice: TBCDField;
    ADOQOuttype60: TStringField;
    ADOQOuttotal_amount: TBCDField;
    ADOQOutent_date: TDateTimeField;
    ADOQOutEMPLOYEE_NAME: TStringField;
    ADOQOutCPTatal: TBCDField;
    ADOQOutCUST_CODE: TStringField;
    ADOQOutPRODUCT_DESC: TStringField;
    ADOQOutPR_GRP_CODE: TStringField;
    ADOQOutDSDesigner: TStringField;
    ADOQOutunit_name: TStringField;
    ADOQOutCONF_DATE: TDateTimeField;
    ADOQOutcut_no: TStringField;
    ADOQOutremark: TStringField;
    ADOQOutPO_NO: TWideStringField;
    ADOQOutsales_number: TStringField;
    ADOQOutDEPT_NAME: TStringField;
    Label2: TLabel;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
//    procedure DBGridEh1TitleClick(Column: TColumnEh);

    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
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
  FormOut: TFormOut;

implementation

uses udm,common;

{$R *.dfm}

procedure TFormOut.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFormOut.BitBtn2Click(Sender: TObject);
begin
if DBGridEh1.DataSource.DataSet.Active then
if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
 Export_dbGridEH_to_Excel(DBGridEh1,'³ö²ÖÐÅÏ¢') ;
end;

procedure TFormOut.BitBtn5Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFormOut.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker =smDownEh then
 begin
   column.Title.SortMarker:=smUpEh;
   ADOQOut.Sort:=Column.FieldName;
 end
 else
 begin
   column.Title.SortMarker:=smDownEh;
   ADOQOut.Sort:=Column.FieldName+' DESC';
 end;
 // Edit3.Enabled:= not (DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime]);

 if (PreColumn.FieldName<>column.FieldName) and  (column.Field.DataType in [ftString,ftWideString]) then // (column.ReadOnly) then
   begin
    self.field_name:=column.FieldName;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    label2.Caption := column.Title.Caption;
    PreColumn := column;
   end
   else
   Edit3.SetFocus;
end;

procedure TFormOut.init;
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
end;

procedure TFormOut.FormShow(Sender: TObject);
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

procedure TFormOut.item_click(sender: TObject);
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

procedure TFormOut.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 { if (ssAlt in Shift)  and  (Key=86) then
  showmessage(ADOQOut.SQL.Text); }

  if (chr(key)='V') and (ssalt in shift) then
 showmessage(ADOQOut.SQL.Text);
 if (ssCtrl in shift) and (key=46) then  abort;
 if (key=45) then abort;      //insert¼ü
  

end;

procedure TFormOut.Edit3Change(Sender: TObject);
begin
 if trim(Edit3.text)<>'' then
  ADOQOut.Filter := self.field_name+' like ''%'+trim(edit3.Text)+'%'''
 else
  ADOQOut.Filter := '';
end;

procedure TFormOut.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='S') and (ssalt in shift) then
  showmessage(ADOQOut.SQL.Text);
end;

procedure TFormOut.FormCreate(Sender: TObject);
begin
 init;
end;

end.
