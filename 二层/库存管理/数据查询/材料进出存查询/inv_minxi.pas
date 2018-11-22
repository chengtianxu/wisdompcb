unit inv_minxi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj, Excel2000, ClipBrd,
  Menus, Buttons;

type
  TForm9 = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ado0022: TADOQuery;
    ado0022INV_PART_NUMBER: TStringField;
    ado0022GROUP_NAME: TStringField;
    ado0022WAREHOUSE_CODE: TStringField;
    ado0022code23: TStringField;
    ado0022QUAN_ON_HAND: TFloatField;
    ado0022CURR_CODE: TStringField;
    ado0022tax_PRICE: TFloatField;
    ado0022LOCATION: TStringField;
    ado0022UNIT_NAME: TStringField;
    ado0022EXPIRE_DATE: TDateTimeField;
    ado0022INV_DESCRIPTION: TStringField;
    ado0022inv_name: TStringField;
    ado0022PO_REV_NO: TStringField;
    ado0022GRN_NUMBER: TStringField;
    ado0022BARCODE_ID: TStringField;
    ado0022ship_DATE: TDateTimeField;
    ado0022rohs: TStringField;
    ado0022supplier2: TStringField;
    ado0022TAX_2: TBCDField;
    ado0022price: TBCDField;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    ado0022total_area: TFloatField;
    ado0022exch_rate: TBCDField;
    ado0022L_no_taxprice: TBCDField;
    ado0022L_tax_price: TBCDField;
    ado0022amount_notax: TBCDField;
    ado0022amount_tax: TBCDField;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    ado0022STOCK_BASE: TFloatField;
    ado0022DSDesigner: TFloatField;
    ado0022QUAN_TO_BE_STOCKED: TBCDField;
    ado0022quan_allow: TBCDField;
    Label5: TLabel;
    Edit5: TEdit;
    ado0022eff_day: TIntegerField;
    ado0022cust_decl: TStringField;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    ado0022reason: TStringField;
    ado0022PO_NUMBER: TStringField;
    ado0022spec_place: TStringField;
    ado0022stype: TStringField;
    ado0022TDATE: TDateTimeField;
    ado0022rkey16: TAutoIncField;
    ADOQuery1: TADOQuery;
    ado0022PACKING_SLIP_FLAG: TStringField;
    strngfldado0022inv_group_name: TStringField;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    ado0022rkey22: TAutoIncField;
    strngfldado0022ANALYSIS_CODE_1: TStringField;
    strngfldado0022EMPLOYEE_NAME: TStringField;
    strngfldado0022CONFIRMATION_NUMBER: TStringField;
    ado0022PO_REQ_NUMBER: TStringField;
    intgrfldado0022InDays: TIntegerField;
    Label6: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label7: TLabel;
    Edit8: TEdit;
    Label8: TLabel;
    Edit9: TEdit;
    Label9: TLabel;
    ColorDialog1: TColorDialog;
    ado0022IQC: TStringField;
    ado0022IQC2: TDateTimeField;
    ado0022IQCstatus: TStringField;
    strngfldado0022state: TStringField;
    Edit10: TEdit;
    lbl1: TLabel;
    ado0022rkey391: TAutoIncField;
    N2: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
//    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ado0022tax_PRICEChange(Sender: TField);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ado0022BeforeDelete(DataSet: TDataSet);
    procedure ado0022BeforeEdit(DataSet: TDataSet);
    procedure ado0022BeforeInsert(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
    procedure item_click(sender:TObject);    
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses main,common, BzReport, invt_report, ppCtrls;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//self.ado0022.UpdateBatch();
 form1.Show;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
 form1.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
field_name:='INV_PART_NUMBER';
end;

procedure TForm9.Edit3Change(Sender: TObject);
begin
if (trim(edit3.Text)<>'') then
 Ado0022.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 self.ado0022.filter := '';
end;

procedure TForm9.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.FieldName<>field_name) then 
  ado0022.sort:=column.FieldName+' ASC';
  
 if ((column.Field.DataType=ftString) or (Column.Field.DataType=ftwidestring)) and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;
 end;

end;

procedure TForm9.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado0022.SQL.Text);
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (datasource1.DataSet.RecNo=datasource1.DataSet.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录

end;

procedure TForm9.BitBtn5Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm9.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm9.FormActivate(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
  for i:=1 to dbgrid1.FieldCount do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
   if dbgrid1.Columns[i-1].Visible then
    item.Checked:=true;
   item.OnClick:=item_click;
   self.PopupMenu1.Items.Add(item);
  end;
  if form9.PopupMenu1.tag<=2 then
  begin
    for i:=12 to 20 do self.PopupMenu1.Items[i].Enabled:=false;
  end;

  Edit8.Color:=$EBEBEB;
  Edit10.Color:= $E1FAE1;
end;

procedure TForm9.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if ((ado0022eff_day.Value>0) and (ado0022eff_day.Value <= 30))then      //取将过期和即将呆滞
    DBGrid1.Canvas.Font.Color := clBlue
   else if ado0022eff_day.Value < 0 then      //过期的
    DBGrid1.Canvas.Font.Color := clred;

  if  (ado0022.fieldbyname('indays').value>=335) and (ado0022.fieldbyname('indays').value<=365) then
    DBGrid1.Canvas.Brush.Color:=$E1FAE1 ;
 // else if ado0022.fieldbyname('indays').value>365 then
 //   DBGrid1.Canvas.Brush.Color:= $EBEBEB;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//procedure TForm9.FormShow(Sender: TObject);
//begin
//  if form9.PopupMenu1.tag=4 then
//  begin
//    Self.ado0022EXPIRE_DATE.ReadOnly:=false; //有效期
//    Self.ado0022BARCODE_ID.ReadOnly:=False;  //备注（生产日期）
//    Self.ado0022cust_decl.ReadOnly:=False;   //报废单号
//    self.ado0022spec_place.ReadOnly:=false;  //具体位置
//    self.ado0022PACKING_SLIP_FLAG.ReadOnly:=False //耐CAF
//  end;
//end;

procedure TForm9.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm9.BitBtn4Click(Sender: TObject);
begin
  if MessageBox(Handle,'确定导出EXCEL表吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
   form1.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

procedure TForm9.ado0022tax_PRICEChange(Sender: TField);
begin
//self.ado0022price.Value:=self.ado0022tax_PRICE.Value/(1+ado0022TAX_2.Value*0.01);
end;

procedure TForm9.DBGrid1CellClick(Column: TColumn);
begin
//  if Trim(ado0022rkey16.AsString)<>'' then
//  with ADOQuery1 do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Add('select rkey,location,rkey_16 from data0176 where rkey_16='+ado0022rkey16.AsString);
//    Open;
//    DBGrid1.Columns[31].PickList.Clear;
//    if not IsEmpty then
//    begin
//      while not Eof do
//      begin
//        DBGrid1.Columns[31].PickList.Add(FieldValues['location']);
//        Next;
//      end;
//    end;
//  end;
end;


procedure TForm9.ado0022BeforeDelete(DataSet: TDataSet);
begin
Abort;
end;

procedure TForm9.ado0022BeforeEdit(DataSet: TDataSet);
begin
  if (StrToInt(vprev) = 1) or (StrToInt(vprev) = 3) then
  begin
    MessageDlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Abort;
  end;
end;

procedure TForm9.ado0022BeforeInsert(DataSet: TDataSet);
begin
 Abort;
end;

procedure TForm9.N1Click(Sender: TObject);
begin
 form_bzreport:=tform_bzreport.Create(application);
 form_bzreport.ado22.close;
 form_bzreport.ado22.Parameters[0].Value:=ado0022rkey22.Value;
 form_bzreport.ado22.open;

 form_bzreport.ADO493.Close;
 form_bzreport.ADO493.Open;

 Form_bzreport.ppReport1.Reset;
 Form_bzreport.ppReport1.Template.FileName :=
     StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'Wlbzreport.rtm';
 Form_bzreport.ppReport1.Template.LoadFromFile;
 form_bzreport.ppReport1.SaveAsTemplate:=false;
 form_bzreport.ppReport1.Print;
 form_bzreport.free;
end;

procedure TForm9.PopupMenu2Popup(Sender: TObject);
begin
 N1.Enabled:=(StrToInt(vprev)=2) or (StrToInt(vprev)=4);
end;

procedure TForm9.N2Click(Sender: TObject);
var
  LFrm: TForm_report;
  Img2DBar: TppImage;
  I,J: Integer;
  LText: string;
begin
  LFrm:= TForm_report.Create(Application);
  try
    LFrm.qryCode.Close;
    LFrm.qryCode.Parameters[0].Value:= ado0022rkey391.Value;
    LFrm.qryCode.Open;
    if LFrm.qryCode.IsEmpty then
    begin
      ShowMessage('无可打印标签');
      Exit;
    end;
    LFrm.ppReportCode.Reset;
    LFrm.ppReportCode.Template.FileName :=
              StringReplace(uppercase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'IQCCode.rtm';
    LFrm.ppReportCode.Template.LoadFromFile;


    LFrm.ppReportCode.ObjectByName(I,J,'ppImage1');

    Img2DBar := LFrm.ppReportCode.Bands[I].Objects[J] as TppImage;
    LText := Lfrm.qryCode.fieldbyname('条码编号').AsString;
    LFrm.Get2DCodeBmp(LText,Img2DBar.Picture);

    LFrm.ppReportCode.SaveAsTemplate:= False;
    LFrm.ppReportCode.SaveAsTemplate:= False;
    LFrm.ppReportCode.Print;
  finally
    LFrm.Free;
  end;
end;

end.
