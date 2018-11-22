unit UGroupBIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, DB, ADODB;

type
  TGroupBIn_Form = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    ADOQIn: TADOQuery;
    DataSource1: TDataSource;
    ADOQInLOCATION: TStringField;
    ADOQInPRODUCT_NAME: TStringField;
    ADOQInInDH: TStringField;
    ADOQIntype: TWordField;
    ADOQInsys_date: TDateTimeField;
    ADOQInUNIT_NAME: TStringField;
    ADOQInPR_GRP_CODE: TStringField;
    ADOQInPRODUCT_GROUP_NAME: TStringField;
    ADOQInQUANTITY: TBCDField;
    ADOQInEMPLOYEE_NAME: TStringField;
    ADOQInPRODUCT_DESC: TStringField;
    ADOQInDEPT_NAME: TStringField;
    ADOQInCUT_NO: TStringField;
    ADOQInISSUED_QTY: TIntegerField;
    ADOQInDEPT_CODE: TStringField;
    ADOQInPROD_CODE: TStringField;
    ADOQInc_type: TStringField;
    ADOQInDSDesigner: TStringField;
    ADOQInABBR_NAME: TStringField;
    ADOQInREFERENCE_NUMBER: TStringField;
    ADOQInISSUE_DATE: TDateTimeField;
    ADOQInprice: TBCDField;
    ADOQInsales_order: TStringField;
    ADOQIntax_rate: TBCDField;
    ADOQInprices: TBCDField;
    ADOQIncust_code: TStringField;
    ADOQIncustomer_name: TStringField;
    Label2: TLabel;
    Edit2: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure ADOQInCalcFields(DataSet: TDataSet);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2Change(Sender: TObject);
  private
      PreColumn: TColumnEh;
      field_name:string;
      //sSql :string;
      procedure init;
      procedure item_click(sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GroupBIn_Form: TGroupBIn_Form;

implementation

uses udm,common, UMainQuery;

{$R *.dfm}


procedure TGroupBIn_Form.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TGroupBIn_Form.BitBtn2Click(Sender: TObject);
begin
if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh1,'入仓信息') ;

end;

procedure TGroupBIn_Form.BitBtn5Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TGroupBIn_Form.FormCreate(Sender: TObject);
begin
init;
end;

procedure TGroupBIn_Form.init;
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  //sSql:= dm.ADS60.CommandText;
end;

procedure TGroupBIn_Form.FormShow(Sender: TObject);
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

procedure TGroupBIn_Form.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   ADOQIn.Sort:=Column.FieldName;
  end
 else
 begin
   column.Title.SortMarker:=smDownEh;
   ADOQIn.Sort:=Column.FieldName+' DESC';
 end;
 if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
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

procedure TGroupBIn_Form.item_click(sender: TObject);
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

procedure TGroupBIn_Form.ADOQInCalcFields(DataSet: TDataSet);
begin
 case self.ADOQINtype.Value of
  1:self.ADOQINc_type.Value:='直接入库';
  2:self.ADOQINc_type.Value:='生产入库';
  3:self.ADOQINc_type.Value:='退货入库';
 end;
end;

procedure TGroupBIn_Form.ComboBox1Change(Sender: TObject);
begin
if combobox1.ItemIndex<>combobox1.Items.Count-1 then
 begin

  self.ADOQIN.EnableControls;
  with self.ADOQIN do
   begin
    close;
    IF pos(sql[sql.Count-3],'and data0416.type=')>0 then
      begin
        sql.Delete(sql.Count-2);
        sql.Insert(sql.Count-1,inttostr(combobox1.ItemIndex+1));
      end
    else
      begin
        sql.Insert(sql.Count-1,'and data0416.type=');
        sql.Insert(sql.Count-1,inttostr(combobox1.ItemIndex+1));
      end;
    open;
   end;
   self.ADOQIN.DisableControls;
   //合计
    Edit1.Text:=floattostr(Main_Form.sumQuantity(ADOQIN,'QUANTITY'));
 end
else
 begin
  self.ADOQIN.EnableControls;
  with self.ADOQIN do
   begin
    close;
    IF pos(sql[sql.Count-3],'and data0416.type=')>0 then
      begin
        sql.Delete(sql.Count-2);
        sql.Delete(sql.Count-2);

      end;

    open;
   end;
   self.ADOQIN.DisableControls;
     //合计
    Edit1.Text:=floattostr(Main_Form.sumQuantity(ADOQIN,'QUANTITY'));
 end;
end;

procedure TGroupBIn_Form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(ADOQIn.SQL.Text);
end;

procedure TGroupBIn_Form.Edit2Change(Sender: TObject);
begin
  if trim(Edit2.text)<>'' then
  ADOQIn.Filter := self.field_name+' like ''%'+trim(edit2.Text)+'%'''
 else
  ADOQIn.Filter := '';
end;

end.
