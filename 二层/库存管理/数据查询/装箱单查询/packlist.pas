unit packlist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj,Excel2000,ClipBrd,
  Menus, Buttons, MyClass;

type
  TForm2 = class(TForm)
    ADO439: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADO439delivery_no: TStringField;
    ADO439date_sailing: TDateTimeField;
    ADO439CUST_CODE: TStringField;
    ADO439cartons_no: TIntegerField;
    ADO439charge: TFloatField;
    ADO439SALES_ORDER: TStringField;
    ADO439SHIPMENT_NO: TSmallintField;
    ADO439PO_NUMBER: TStringField;
    ADO439EMPLOYEE_NAME: TStringField;
    ADO439PO_DATE: TDateTimeField;
    Panel1: TPanel;
    ADO439invoice_number: TStringField;
    ADO439part_price: TFloatField;
    ADO439amount: TFloatField;
    ADO439QUAN_SHIPPED: TIntegerField;
    ADO439fob: TStringField;
    ADO439reference_number: TStringField;
    ADO439Remark: TStringField;
    ADO439SCH_DATE: TDateTimeField;
    ADO439mianji: TFloatField;
    ADO439weigth: TFloatField;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ADO439ANALYSIS_CODE_2: TStringField;
    ADO439MANU_PART_NUMBER: TStringField;
    ADO439MANU_PART_DESC: TStringField;
    ADO439REFERENCE_60: TStringField;
    ADO439PRODUCT_NAME: TStringField;
    PopupMenu1: TPopupMenu;
    ADO439abbr_name: TStringField;
    ADO439curr_code: TStringField;
    ADO439cust_decl: TStringField;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    ADO439preamount: TFloatField;
    ADO439GLPTR_STATUS: TBooleanField;
    ADO439cost_2: TFloatField;
    ADO439ovsh_qty: TIntegerField;
    ADO439TAX_2: TBCDField;
    ADO439tax_amount: TFloatField;
    ADO439tax_preamount: TFloatField;
    Edit3: TEdit;
    Label3: TLabel;
    ADO439layers: TWordField;
    ADO439TOTAL_ADD_L_PRICE: TFloatField;
    ADO439tax_in_price: TStringField;
    ADO439ORIG_CUSTOMER: TStringField;
    ADO439rkey: TAutoIncField;
    ADO439remark64: TStringField;
    ADO439ANALYSIS_CODE_1: TStringField;
    ADO439ANALYSIS_CODE_5: TStringField;
    ADO439set_qty: TIntegerField;
    ADO439if_invice: TStringField;
    ADO439part_taxprice: TFloatField;
    ADO439EXCH_RATE: TFloatField;
    ADO439mianji_bb: TFloatField;
    ADO439DATE_ASSIGN: TDateTimeField;
    ADO439POSTED_DATE: TDateTimeField;
    BitBtn5: TBitBtn;
    tmp: TADOQuery;
    ADO439SUPPLIER_NAME_23: TStringField;
    ADO439QUAN_CREDITED: TIntegerField;
    ADO439assign_type: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
  private
    rkey419:Integer;
    mc:TMyDataClass;
    ADOQuery1sql :string;
    { Private declarations }
    procedure item_click(sender:TObject);
    procedure loadField(tmp2: TADOQuery;DbGrid: TDBGrid);
    procedure showField(rkey:Integer;dbGrid:TDBGrid);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses main, report_pk,common, PasFieldShow;
{$R *.dfm}

procedure TForm2.loadField(tmp2: TADOQuery;DbGrid: TDBGrid);
var
  i:Integer;
begin
  with tmp2 do
  begin
    Sort:='FieldOrder';
    First;
    while not Eof do
    begin
      for i:=0 to DbGrid.Columns.Count-1 do
      begin
        if (FieldByName('FieldName').Value=DbGrid.Columns[i].FieldName) then
        begin
          if (FieldByName('IsDisplay').Value <> DbGrid.Columns[i].Visible) or (FieldByName('FieldWidth').Value <> DbGrid.Columns[i].Width) then
          begin
            DbGrid.Columns[i].Visible:= FieldByName('IsDisplay').Value;
            DbGrid.Columns[i].Width:= FieldByName('FieldWidth').Value;
          end;

          DbGrid.Columns[i].Index:= tmp2.RecNo - 1 ;

          Break;
        end;
      end;
      Next;
    end;
  end;
end;

procedure TForm2.showField(rkey:Integer;dbGrid:TDBGrid);
var
  i,addInt:Integer;
  tmpstr:string;
  aqtmp:TADOQuery;
  bool : Integer;
  addField:Boolean;
begin
  try
    aqtmp:=TADOQuery.Create(nil);
    aqtmp.Connection:=Form1.ADOConnection1;
    tmpstr:='select Rkey, D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay '+
              ' from data0849 where D419_ptr= '+ IntToStr(rkey) +' and D073_ptr= ' + rkey73;
//              +' and FormName= '+ QuotedStr(Self.Name) + ' and GridName= '+ QuotedStr(dbGrid.Name);
    if mc.OpenQuery(aqtmp,tmpstr) then
    begin
      with aqtmp do
      begin
        if not IsEmpty then
        begin
          if RecordCount >= dbGrid.Columns.Count then    //没有增加字段，按数据库的数据调整排序，可见以及宽度
          begin
              loadField(aqtmp,DbGrid);          //加载字段
          end
          else
          begin                                                  //增加了字段，把新加的字段加入数据库中
            addInt:= dbGrid.Columns.Count-RecordCount;     //存增加了多少个字段
            addField:=True;
            for i:=0 to dbGrid.Columns.Count-1 do
            begin
              First;
              while not Eof do
              begin
                if DBGrid.Columns[i].FieldName=FieldByName('FieldName').Value then
                begin
                  addField:=False;
                  Break;
                end;
                addField:=True;
                Next;
//                if dbGrid.Columns[i].FieldName=FieldByName('FieldName').Value then
//                begin
//                  Break;
//                end;
//                tmpstr:='insert into data0849(D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay,FormName,GridName)' +
//                                        'values('+IntToStr(rkey)+','+ rkey73+','+ QuotedStr(dbGrid.Columns[i].FieldName)+','+
//                                        QuotedStr(dbGrid.Columns[i].Title.Caption)+','+ IntToStr(dbGrid.Columns.Count - addInt)+','+
//                                        IntToStr(dbGrid.Columns[i].Width)+','+ QuotedStr(BoolToStr(dbGrid.Columns[i].Visible,True)) + ','+
//                                        QuotedStr(Self.Name) +','+ QuotedStr(dbGrid.Name)+')'+#13;
//                tmp.Close;
//                tmp.SQL.Text:=tmpstr;
//                tmp.ExecSQL;
////                mc.ExecSql(tmpstr);
//                addInt:=addInt - 1;
//                if addInt = 0 then Break;
//                Next;
              end;
              if addField then
              begin
                if DBGrid.Columns[i].Visible then bool:=1
                else bool:=0;
                with tmp do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Text:= SQL.Text+ 'insert into data0849(D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay,FormName,GridName)' +
                                        'values('+IntToStr(rkey419)+','+ rkey73+','+ QuotedStr(DBGrid1.Columns[i].FieldName)+','+
                                        QuotedStr(DBGrid1.Columns[i].Title.Caption)+','+ IntToStr(DBGrid1.Columns.Count - addInt)+','+
                                        IntToStr(DBGrid1.Columns[i].Width)+','+ IntToStr(bool)+ ',''frmMain'',''dbMain'')'+#13;
                  ExecSQL;
                end;
                addInt:=addInt - 1;
                if addInt = 0 then Break;
              end;
            end;
            loadField(aqtmp,DbGrid);          //加载字段

          end;
        end
        else
        begin
          tmpstr:='';                         //如果当前使用人员当前程序在849表没找到，则新增
          for i:=0 to dbGrid.Columns.Count-1 do
          begin
            tmpstr:=tmpstr+ 'insert into data0849(D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay,FormName,GridName)' +
                                  'values('+IntToStr(rkey)+','+ rkey73+','+ QuotedStr(dbGrid.Columns[i].FieldName)+','+
                                  QuotedStr(dbGrid.Columns[i].Title.Caption)+','+ IntToStr(dbGrid.Columns[i].Index)+','+
                                  IntToStr(dbGrid.Columns[i].Width)+','+ QuotedStr(BoolToStr(dbGrid.Columns[i].Visible,True)) + ','+
                                  QuotedStr(Self.Name) +','+ QuotedStr(dbGrid.Name)+')'+#13;
          end;
          tmp.Close;
          tmp.SQL.Text:=tmpstr;
          tmp.ExecSQL;
        end;
      end;
    end;
  finally
    aqtmp.Close;
    aqtmp.Connection:=nil;
    aqtmp.Free;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
 form1.Show;
 close;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssCtrl in shift) and (key=46) then  abort; //删除记录
 if (ssAlt in shift) and (key=45) then abort;

 if (key=40) and        //如果是下箭头如果是最后一条记录
  (ado439.RecNo=ado439.RecordCount) then abort;
 if key=45 then abort; //insert键
// if (key=46) and (ssCtrl in shift) then abort;//删除记录


 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado439.SQL.Text);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);

 if strtoint(vprev)<=2 then      //权限
  begin
   form_report.ppDBText13.Visible:=false;
   form_report.ppDBText14.Visible:=false;
  end;
 ado439.DisableControls;
 form_report.ppReport1.Print;
 ado439.EnableControls;
finally
 form_report.free;
end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm2.item_click(sender: TObject);
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

procedure TForm2.FormActivate(Sender: TObject);
//var
// i:byte;
// item:TMenuItem;
begin
//  for i:=1 to dbgrid1.FieldCount do
//  begin
//   item:=TmenuItem.Create(self);
//   item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
//   if dbgrid1.Columns[i-1].Visible then
//    item.Checked:=true;
//   item.OnClick:=item_click;
//   self.PopupMenu1.Items.Add(item);
//  end;
  with Tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select Rkey from data0419 where programe=''A_EP070.exe''';
    Open;
    if not IsEmpty then
     rkey419:= FieldByName('rkey').Value;
  end;
  Self.showField(rkey419,DBGrid1);
  //Self.showField(51,DBGrid1);
end;


procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
  if (strtoint(vprev) <= 2)  then
  begin
   (sender as TPopupmenu).Items.Items[21].Enabled:=false;
   (sender as TPopupmenu).Items.Items[22].Enabled:=false;
   (sender as TPopupmenu).Items.Items[23].Enabled:=false;
   (sender as TPopupmenu).Items.Items[24].Enabled:=false;
   (sender as TPopupmenu).Items.Items[25].Enabled:=false;
   (sender as TPopupmenu).Items.Items[26].Enabled:=false;
   (sender as TPopupmenu).Items.Items[27].Enabled:=false;
   (sender as TPopupmenu).Items.Items[28].Enabled:=false;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  if (StrToInt(vprev)=4) then
   begin
     Self.ADO439cust_decl.ReadOnly:=False; //报关单号允许编辑
   end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 form1.Show;
 close;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
  Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);

 if strtoint(vprev)<=2 then      //权限
  begin
    form_report.ppDBText13.Visible:=false;
    form_report.ppDBText14.Visible:=false;
  end;
 ado439.DisableControls;
 form_report.ppReport1.Print;
 ado439.EnableControls;
finally
 form_report.free;
end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
  try
    frmFieldShow:=TfrmFieldShow.Create(Application);
    frmFieldShow.key419:=rkey419;
    if frmFieldShow.ShowModal=mryes then
    begin
      Self.showField(rkey419,DBGrid1);
    end;
  finally
    frmFieldShow.Free;
  end;
end;

procedure TForm2.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i,itmp:Integer;
begin
  if MessageDlg('列顺序已经改变，是否保存排序？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    if FromIndex>ToIndex then
    begin
      itmp:=FromIndex;
      FromIndex:=ToIndex;
      ToIndex:=itmp;
    end;
    for i:= FromIndex to ToIndex do
    begin
      tmp.Close;
      tmp.SQL.Clear;
      tmp.SQL.Text:='update data0849 set fieldorder='+ IntToStr(i)+' where D419_ptr='+
                IntToStr(rkey419) +' and D073_ptr='+rkey73 +
                ' and fieldname=' + QuotedStr(DBGrid1.Columns[i].FieldName);
      tmp.ExecSQL;
    end;
  end;
end;

end.
