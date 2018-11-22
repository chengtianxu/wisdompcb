unit main;

interface

uses                 
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls,OleServer, Excel2000,
  ComObj,DB,ADODB;

type
  TForm_Main = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Grd1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    OpenDialog1: TOpenDialog;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox6: TCheckBox;
    PopupMenu2: TPopupMenu;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    N9: TMenuItem;
    BitBtn5: TBitBtn;
    N10: TMenuItem;
    N11: TMenuItem;
    PopupMenu3: TPopupMenu;
    CheckBox3: TCheckBox;
    N12: TMenuItem;
    N13: TMenuItem;
    PopupMenu4: TPopupMenu;
    N14: TMenuItem;
    N15: TMenuItem;
    N18: TMenuItem;
    N17: TMenuItem;
    Button1: TButton;
    StringGrid1: TStringGrid;
    N16: TMenuItem;
    N8: TMenuItem;
    Button2: TButton;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql:string;
    dDate:TDateTime;
    sPoAPI:string;
    procedure item_click(sender:TObject);
    procedure ExcelToDB;
    procedure checkvar();
    procedure ShowADOQueryDataOnStringGrid(ADOQuery: TADOQuery;SG: TStringGrid);
    function GetIDKey(ParamName:string):string;
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;
const
  TmpFileDir = 'c:\tmp\';

implementation

uses demo,common, detail, condition, soprint, PubFunc, ShellAPI,
  PasSelectDate;

{$R *.dfm}
function TForm_Main.GetIDKey(ParamName:string):string;
begin
  dm.Adotmp2.Close;
  dm.Adotmp2.SQL.Text:='select * from dbo.B2B_Param where ParamName='''+ParamName+'''';
  dm.Adotmp2.Open;
  if not dm.Adotmp2.IsEmpty then
    Result:=DM.Adotmp2.fieldBYName('IDKey').AsString
  else
    Result:='-1';
end;

procedure TForm_Main.ShowADOQueryDataOnStringGrid(ADOQuery: TADOQuery; SG: TStringGrid);
var //把ADOQuery的数据显示在StringGrid上.
  iCount, iCell, iRecordCount, iFieldCount: Integer;
begin
  SG.RowCount := 1;
  for iCount := 1 to SG.ColCount - 1 do
    SG.Cells[iCount, 1] := '';
  SG.Update;
  iRecordCount := ADOQuery.RecordCount;
  iFieldCount := ADOQuery.FieldCount;
  SG.RowCount := iRecordCount + 1;
  SG.ColCount := iFieldCount + 1;
  if iRecordCount = 0 then
  begin
    SG.RowCount := 2; SG.FixedRows := 1;
  end
  else
    SG.FixedRows := 1;
  if iFieldCount = 0 then
  begin
    SG.ColCount := 2; SG.FixedCols := 1;
  end
  else
    SG.FixedCols := 1;
    SG.Cells[0, 0] := '序号'; //显示序号名称
    SG.Cells[1, 0] := 'POCode号';
    SG.Cells[2, 0] := '客户型号';
    SG.Cells[3, 0] := '订单数量';
    SG.Cells[4, 0] := '客户物料号';
    SG.Cells[5, 0] := '送货地址';
  if iRecordCount > 0 then
  begin
    ADOQuery.First;
    for iCount := 1 to iRecordCount do
    begin
      for iCell := 1 to iFieldCount do
        SG.Cells[iCell-1, iCount] := Trim(ADOQuery.Fields[iCell - 1].AsString);
      ADOQuery.Next;
    end;
  end;
  SG.Update;
end;

procedure TForm_Main.FormCreate(Sender: TObject);
var i:integer;
    item:TmenuItem;
begin
 if not app_init_2(dm.ADOConnection1) then
  begin
    ShowMessage('程序起动失败,请与管理员联系!');
    application.Terminate;
  end;
  self.Caption:= application.Title;

//  if GetServerRegion(DM.ADOConnection1) = '深圳' then
//  begin
//    ShowMessage('旧版本程序已经停止，请用新版本系统，请联系ERP');
//    Application.Terminate;
//  end;

//  dm.ADOConnection1.Open;
//  user_ptr:='1752';
//  rkey73:='1593';
//  vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;

  for i := 1 to Grd1.Columns.Count do
  begin
    item := TmenuItem.Create(self);
    item.Caption := Grd1.Columns[i - 1].Title.Caption;
    item.Checked := Grd1.Columns[i - 1].Visible;
    item.OnClick := item_click;
    self.PopupMenu2.Items.Add(item);
  end;
//  CheckBox6Click(Sender);
end;

procedure TForm_Main.item_click(sender: TObject);
var
  i:integer;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to Grd1.FieldCount - 1 do
    if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible := true;
      break;
    end ;
  end else begin
    for i := 0 to Grd1.FieldCount - 1 do
    if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible := false;
      break;
    end;
  end;

end;

procedure TForm_main.ExcelToDB;
var
  fileName:String;
  iCount, jCount: Integer;
  XLApp: variant;
  Sheet: Variant;
begin
  if OpenDialog1.Execute then  fileName:=OpenDialog1.FileName else exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
   begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
   end;
  try
   XLApp := CreateOleObject('Excel.Application');
  except
   Screen.Cursor := crDefault;
   Exit;
  end;
   try
     XLApp.workBooks.Open(fileName);
     Sheet := XLApp.Workbooks[1].WorkSheets[1];
     DM.ADO213.DisableControls;
     dm.aq192.Close;
     dm.aq192.Open;
     for iCount:=2 to 65535 do
     begin
        if trim(XLApp.workbooks[1].sheets[1].cells[iCount,5]) = '' then Break;
         with dm.ADOQuery2 do
         begin
           Close;
           SQL.Clear;
           SQL.Add('select data0010.cust_code from data0025 inner join');
           SQL.Add('data0010 on data0025.customer_ptr=data0010.rkey');
           SQL.Add('where data0025.manu_part_number='+quotedstr(trim(XLApp.workbooks[1].sheets[1].cells[iCount,1])));
           Open;
         end;
        if dm.ADOQuery2.IsEmpty then
        begin
         MessageDlg('第'+inttostr(iCount)+'行本厂编号所绑定的客户代码在系统中不存在,请联系市场部!',mtInformation,[mbok],1);
         Continue;
        end;
        if (DM.aq192custcoTool.Value<>'Y') and (dm.ADOQuery2.FieldByName('cust_code').Value<>trim(XLApp.workbooks[1].sheets[1].cells[iCount,5])) then
        begin
          MessageDlg('第'+inttostr(iCount)+'行本厂编号所绑定的客户代码与导入的客户代码不一致,请联系市场部!',mtInformation,[mbok],1);
          Continue;
        end;
//20161024tang修改导入的合同号必须是从97中取
        DM.ADOQuery1.Close;
        DM.ADOQuery1.SQL.Clear;
        DM.ADOQuery1.SQL.Text:='select top 1 * from data0097 where PO_NUMBER='+quotedstr(trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]));
        dm.Adoquery1.Open;
        if dm.ADOQuery1.IsEmpty then
        begin
         MessageDlg('第'+inttostr(iCount)+'行合同编号在客户订单号系统中不存在,请先建立好客户订单号信息!',mtInformation,[mbok],1);
         Continue;
        end;
//end 20162024-----------------------------
       if trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) = '' then Break;
//20160311tang修改根据客户型号加物料号最后一个字母确定物料号
//       if ((Trim(XLApp.workbooks[1].sheets[1].cells[icount,4])<>'') and (Length(Trim(XLApp.workbooks[1].sheets[1].cells[icount,3]))=1)) then
//       begin
//         With DM.ADOQuery1 do
//         begin
//           close;
//           SQL.Clear;
//           SQL.Add('select top 1 ANALYSIS_CODE_2 from data0025 where MANU_PART_DESC=:str and  (ANALYSIS_CODE_2 like ''%'+Trim(XLApp.workbooks[1].sheets[1].cells[icount,3])+''')');
////           SQL.Add('select top 1 ANALYSIS_CODE_2 from data0025 where MANU_PART_NUMBER=:str and (patindex(''%'+Trim(XLApp.workbooks[1].sheets[1].cells[icount,3])+''',ANALYSIS_CODE_2) > 0)');
//           Parameters[0].Value:=trim(XLApp.workbooks[1].sheets[1].cells[iCount,4]);
//           Open;
//         end;
//         if not dm.ADOQuery1.IsEmpty then
//         XLApp.workbooks[1].sheets[1].cells[icount,3]:=dm.ADOQuery1.FieldByName('ANALYSIS_CODE_2').AsString;
//       end;
//end 20160311----
        if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,15]) = '是') then XLApp.workbooks[1].sheets[1].cells[iCount,15]:=0 else XLApp.workbooks[1].sheets[1].cells[iCount,15]:=1;
        With DM.ADOQuery1 do
        begin
         close;
         SQL.Clear;
         SQL.Add('select ONHOLD_SALES_FLAG from data0025 where MANU_PART_NUMBER=:str');
         Parameters[0].Value:=trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]);
         Open;
        end;
        if (not DM.ADOQuery1.IsEmpty) and (dm.ADOQuery1.FieldByName('ONHOLD_SALES_FLAG').Value=0) then
        begin
         DM.ADO213.Append;
         for jCount:=1 to 15 do
         DM.ADO213.Fields[jCount].Value:=sheet.cells[iCount,jCount];
         DM.ADO213user_ptr.AsString:=user_ptr;
         DM.ADO213submit_date.Value:=common.getsystem_date(dm.ADOQuery2,0);
         dm.ADO213so_oldnew.Value:='旧单';
         DM.ADO213.Post;
        end
        else
        begin
         MessageDlg('第'+inttostr(iCount)+'行本厂编号还没在销售状态!',mtInformation,[mbok],1);
        end;
     end;
     XLApp.workbooks[1].close;
   finally
     XLApp.quit;
     Screen.Cursor := crDefault;
     DM.ADO213.EnableControls;
   end

end;

procedure TForm_Main.BitBtn10Click(Sender: TObject);
begin
 popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_Main.N1Click(Sender: TObject);
begin
  case TMenuitem(Sender).Tag of
  0,1,4:
   if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    begin
     messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
     exit;
    end
   else
   begin
    with TForm_detail.Create(nil) do
    try
      Ftag:=TMenuitem(Sender).Tag;
      if Ftag=0 then
      begin
        DM.ADO213.Append ;
        dm.ADO213ORIG_SCHED_SHIP_DATE.Value:=common.getsystem_date(dm.ADOQuery2,1);
        dm.ADO213ORIG_REQUEST_DATE.Value:=common.getsystem_date(dm.ADOQuery2,1);
        dm.ADO213PO_DATE.Value:=common.getsystem_date(dm.ADOQuery2,1);
        caption:='新增';
      end;
      if Ftag=1 then
      begin
        Edit4.Text:=DM.ADO213MANU_PART_NUMBER.Value;
        Edit1.Text:=DM.ADO213CURR_CODE.Value;
        Edit2.Text:=DM.ADO213MANU_PART_DESC.Value;
        Edit3.Text:=dm.ADO213ANALYSIS_CODE_2.Value;
        Edit5.Text:=dm.ADO213lis_num.Value;
        Edit6.Text:=dm.ADO213cust_code.Value;
        Edit8.Text:=dm.ADO213PO_NUMBER.Value;
        Edit9.Text:=dm.ADO213PARTS_ORDERED.AsString;
        Edit10.Text:=dm.ADO213PART_PRICE.AsString;
        Edit11.Text:=dm.ADO213orig_customer.AsString;
        Label15.Caption:=dm.ado213customer_name.Value;
//20171205tang添
        if (Trim(DM.ADO213Print2DKey.AsString)<>'') then
        begin
          with dm.ADOQuery1 do
          begin
           Close;
           sql.Clear;
           sql.Add('select * from Print2D_BarDef where D10_Ptr='+Trim(DM.ADO213Print2DKey.AsString));
           Open;
          end;
          Edit16.Text:=dm.ADOQuery1.fieldByName('BarName').AsString;
          Edit16.Tag:=DM.ADO213Print2DKey.Value;
        end;
        with dm.ADOQuery1 do
        begin
         Close;
         sql.Clear;
         sql.Add('select unit_sq from data0025 where manu_part_number='+quotedstr(Edit4.Text));
         Open;
        end;
        Edit7.Text:=FloatToStr(dm.ADOQuery1.FieldValues['unit_sq']*strtoint(Edit9.Text));
        if dm.ADO213so_oldnew.Value='新单' then
        begin
         ComboBox3.ItemIndex:=1;
        end
        else
        if dm.ADO213so_oldnew.Value='旧单' then
        begin
         ComboBox3.ItemIndex:=0;
        end
        else
        begin
         ComboBox3.ItemIndex:=-1;
        end;
        if ComboBox3.ItemIndex=1 then
        begin
          RadioGroup1.Enabled:=True;
        end;
        if DM.ADO213so_style.Value=0 then //20161025添
        RadioButton3.Checked:=True
        else
        RadioButton4.Checked:=True;
//20160422添加价格是否含税标志
        if DM.ADO213EDI_FLAG_FOR_INVOICE.Value=1 then
        RadioButton1.Checked:=True
        else
        RadioButton2.Checked:=True;
        Edit15.Text:=DM.ADO213REFERENCE_NUMBER.AsString;
        with dm.ADOQuery2 do
        begin
         Close;
         SQL.Clear;
         sql.Add('select data0015.abbr_name from data0025 inner join data0015');
         SQL.Add('on data0025.PROD_ROUTE_PTR=data0015.rkey');
         SQL.Add('where data0025.manu_part_number='+quotedstr(Edit4.Text));
         Open;
        end;
        if not DM.ADOQuery2.IsEmpty then
        Edit12.Text:=dm.ADOQuery2.FieldValues['abbr_name'];
        with dm.ADOQuery2 do
        begin
         Close;
         sql.Clear;
         sql.Add('select data0025.QTY_ON_HAND,round(data0025.QTY_ON_HAND*data0025.unit_sq,4) as mianji from data0025');
         SQL.Add('where data0025.manu_part_number='+quotedstr(Edit4.Text));
         Open;
        end;
        if not DM.ADOQuery2.IsEmpty then
        begin
        Edit13.Text:=dm.ADOQuery2.fieldbyname('qty_on_hand').AsString;
        Edit14.Text:=dm.ADOQuery2.fieldbyname('mianji').AsString;
        end;
        RadioGroup1.ItemIndex:=dm.ADO213is_alter.Value;
        Memo1.Text:=dm.ADO213Remark.Value;
        DM.ADO213.Edit;
        caption:='编辑';
      end;
      if Ftag=4 then
      begin
       Edit4.Text:=DM.ADO213MANU_PART_NUMBER.Value;
        Edit1.Text:=DM.ADO213CURR_CODE.Value;
        Edit2.Text:=DM.ADO213MANU_PART_DESC.Value;
        Edit3.Text:=dm.ADO213ANALYSIS_CODE_2.Value;
        Edit5.Text:=dm.ADO213lis_num.Value;
        Edit6.Text:=dm.ADO213cust_code.Value;
        Edit8.Text:=dm.ADO213PO_NUMBER.Value;
        Edit9.Text:=dm.ADO213PARTS_ORDERED.AsString;
        Edit10.Text:=dm.ADO213PART_PRICE.AsString;
        Edit11.Text:=dm.ADO213orig_customer.AsString;
        Label15.Caption:=dm.ado213customer_name.Value;
//20171205tang添
        if (Trim(DM.ADO213Print2DKey.AsString)<>'') then
        begin
          with dm.ADOQuery1 do
          begin
           Close;
           sql.Clear;
           sql.Add('select * from Print2D_BarDef where D10_Ptr='+Trim(DM.ADO213Print2DKey.AsString));
           Open;
          end;
          Edit16.Text:=dm.ADOQuery1.fieldByName('BarName').AsString;
          Edit16.Tag:=DM.ADO213Print2DKey.Value;
        end;
//end 20171205
        with dm.ADOQuery1 do
        begin
         Close;
         sql.Clear;
         sql.Add('select unit_sq from data0025 where manu_part_number='+quotedstr(Edit4.Text));
         Open;
        end;
        Edit7.Text:=FloatToStr(dm.ADOQuery1.FieldValues['unit_sq']*strtoint(Edit9.Text));
        if dm.ADO213so_oldnew.Value='新单' then
        begin
         ComboBox3.ItemIndex:=1;
        end
        else
        if dm.ADO213so_oldnew.Value='旧单' then
        begin
         ComboBox3.ItemIndex:=0;
        end
        else
        begin
         ComboBox3.ItemIndex:=-1;
        end;
        if ComboBox3.ItemIndex=1 then
        begin
          RadioGroup1.Enabled:=True;
        end;
        if DM.ADO213so_style.Value=0 then //20161025添
        RadioButton3.Checked:=True
        else
        RadioButton4.Checked:=True;
//20160422添加价格是否含税标志
        if DM.ADO213EDI_FLAG_FOR_INVOICE.Value=1 then
        RadioButton1.Checked:=True
        else
        RadioButton2.Checked:=True;
        Edit15.Text:=DM.ADO213REFERENCE_NUMBER.AsString;
        with dm.ADOQuery2 do
        begin
         Close;
         SQL.Clear;
         sql.Add('select data0015.abbr_name from data0025 inner join data0015');
         SQL.Add('on data0025.PROD_ROUTE_PTR=data0015.rkey');
         SQL.Add('where data0025.manu_part_number='+quotedstr(Edit4.Text));
         Open;
        end;
        if not DM.ADOQuery2.IsEmpty then
        Edit12.Text:=dm.ADOQuery2.FieldValues['abbr_name'];
        with dm.ADOQuery2 do
        begin
         Close;
         sql.Clear;
         sql.Add('select data0025.QTY_ON_HAND,round(data0025.QTY_ON_HAND*data0025.unit_sq,4) as mianji from data0025');
         SQL.Add('where data0025.manu_part_number='+quotedstr(Edit4.Text));
         Open;
        end;
        if not DM.ADOQuery2.IsEmpty then
        begin
        Edit13.Text:=dm.ADOQuery2.fieldbyname('qty_on_hand').AsString;
        Edit14.Text:=dm.ADOQuery2.fieldbyname('mianji').AsString;
        end;
        RadioGroup1.ItemIndex:=dm.ADO213is_alter.Value;
        if DM.ADO213EDI_FLAG_FOR_INVOICE.Value=1 then
        RadioButton1.Checked:=True
        else
        RadioButton2.Checked:=True;
        dm.ADO213.Append;
        dm.ADO213ORIG_SCHED_SHIP_DATE.Value:=common.getsystem_date(dm.ADOQuery2,1);
        dm.ADO213ORIG_REQUEST_DATE.Value:=common.getsystem_date(dm.ADOQuery2,1);
        dm.ADO213PO_DATE.Value:=common.getsystem_date(dm.ADOQuery2,1);
        caption:='复制';
      end;
      ShowModal;
    finally
      free;
    end;
   end;
    3:
    begin
    with TForm_detail.Create(nil) do
    try
     Edit4.Text:=DM.ADO213MANU_PART_NUMBER.Value;
     Edit1.Text:=DM.ADO213CURR_CODE.Value;
     Edit2.Text:=DM.ADO213MANU_PART_DESC.Value;
     Edit3.Text:=dm.ADO213ANALYSIS_CODE_2.Value;
     Edit5.Text:=dm.ADO213lis_num.Value;
     Edit6.Text:=dm.ADO213cust_code.Value;
     Edit8.Text:=dm.ADO213PO_NUMBER.Value;
     Edit9.Text:=dm.ADO213PARTS_ORDERED.AsString;
     Edit10.Text:=dm.ADO213PART_PRICE.AsString;
     Edit11.Text:=dm.ADO213orig_customer.AsString;
     Label15.Caption:=dm.ado213customer_name.Value;
//20171205tang添
        if (Trim(DM.ADO213Print2DKey.AsString)<>'') then
        begin
          with dm.ADOQuery1 do
          begin
           Close;
           sql.Clear;
           sql.Add('select * from Print2D_BarDef where D10_Ptr='+Trim(DM.ADO213Print2DKey.AsString));
           Open;
          end;
          Edit16.Text:=dm.ADOQuery1.fieldByName('BarName').AsString;
          Edit16.Tag:=DM.ADO213Print2DKey.Value;
        end;
//end 20171205
     with dm.ADOQuery1 do
     begin
      Close;
      sql.Clear;
      sql.Add('select unit_sq from data0025 where manu_part_number='+quotedstr(Edit4.Text));
      Open;
     end;
     Edit7.Text:=FloatToStr(dm.ADOQuery1.FieldValues['unit_sq']*strtoint(Edit9.Text));
     if dm.ADO213so_oldnew.Value='新单' then
     begin
      ComboBox3.ItemIndex:=1;
     end
     else
     if dm.ADO213so_oldnew.Value='旧单' then
     begin
      ComboBox3.ItemIndex:=0;
     end
     else
     begin
      ComboBox3.ItemIndex:=-1;
     end;
      if DM.ADO213so_style.Value=0 then //20161025添
      RadioButton3.Checked:=True
      else
      RadioButton4.Checked:=True;
//20160422添加价格是否含税标志
        if DM.ADO213EDI_FLAG_FOR_INVOICE.Value=1 then
        RadioButton1.Checked:=True
        else
        RadioButton2.Checked:=True;
        Edit15.Text:=DM.ADO213REFERENCE_NUMBER.AsString;
     with dm.ADOQuery2 do
     begin
      Close;
      SQL.Clear;
      sql.Add('select data0015.abbr_name from data0025 inner join data0015');
      SQL.Add('on data0025.PROD_ROUTE_PTR=data0015.rkey');
      SQL.Add('where data0025.manu_part_number='+quotedstr(Edit4.Text));
      Open;
     end;
     if not DM.ADOQuery2.IsEmpty then
     Edit12.Text:=dm.ADOQuery2.FieldValues['abbr_name'];
     with dm.ADOQuery2 do
     begin
      Close;
      sql.Clear;
      sql.Add('select data0025.QTY_ON_HAND,round(data0025.QTY_ON_HAND*data0025.unit_sq,4) as mianji from data0025');
      SQL.Add('where data0025.manu_part_number='+quotedstr(Edit4.Text));
      Open;
     end;
     if not DM.ADOQuery2.IsEmpty then
     begin
      Edit13.Text:=dm.ADOQuery2.fieldbyname('qty_on_hand').AsString;
      Edit14.Text:=dm.ADOQuery2.fieldbyname('mianji').AsString;
     end;
     RadioGroup1.ItemIndex:=dm.ADO213is_alter.Value;
     BitBtn3.Enabled:=False;
     BitBtn1.Enabled:=False;
     DBDateTimeEditEh1.Enabled:=False;
     DBDateTimeEditEh2.Enabled:=False;
     DBDateTimeEditEh3.Enabled:=False;
     Edit1.ReadOnly:=True;
     Edit2.ReadOnly:=True;
     Edit3.ReadOnly:=True;
     Edit8.ReadOnly:=True;
     Edit9.ReadOnly:=True;
     Edit10.ReadOnly:=True;
     Edit11.ReadOnly:=True;
     BitBtn2.Enabled:=False;
     BtnSave.Enabled:=False;
     ComboBox3.Enabled:=False;
     RadioGroup1.Enabled:=False;
     Edit5.ReadOnly:=True;
     Edit6.ReadOnly:=True;
     caption:='检查';
     ShowModal;
    finally
      free;
    end;              
    end;
    2:
    begin
     if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
     begin
      messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
      exit;
     end
     else
     begin
      if messagedlg('你确定要删除此未提交的订单吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
      begin
        if (dm.ADO213user_ptr.AsString<>user_ptr) then
        begin
          messagedlg('非本人新建，不能删除！',mtinformation,[mbok],0);
          Exit;
        end;
       with DM.ADOQuery1 do
       begin
        Close;
        SQL.Clear;
        sql.Add('delete from data0213 where rkey='+dm.ADO213RKEY.AsString);
        ExecSQL;
       end;
       BitBtn7Click(Sender);
       ShowMessage('已成功删除此记录!');
      end;
     end;
    end;
  end;
end;

procedure TForm_Main.checkvar();
begin
   if not Checkbox6.Checked  then
    dm.ADO213.Parameters.ParamByName('v1').Value:=0      //未提交
   else
    dm.ADO213.Parameters.ParamByName('v1').Value:=9;
   if not Checkbox1.Checked  then
    dm.ADO213.Parameters.ParamByName('v2').Value:=1      //已提交
   else
    DM.ADO213.parameters.ParamByName('v2').Value :=9;
   if not Checkbox2.Checked  then
    DM.ADO213.Parameters.ParamByName('v3').Value :=3      //已审核
   else
    DM.ADO213.parameters.ParamByName('v3').Value :=9;
   if not Checkbox3.Checked  then                           //已下单
    DM.ADO213.Parameters.ParamByName('v4').Value :=2
   else
    DM.ADO213.parameters.ParamByName('v4').Value :=9;
end;

procedure TForm_Main.BitBtn8Click(Sender: TObject);
begin
 Export_dbGridEH_to_Excel(Grd1,'预处理订单列表');
end;

procedure TForm_Main.BitBtn1Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end
 else
 begin
  ExcelToDB;
  CheckBox6Click(Sender);
 end;
end;

procedure TForm_Main.BitBtn7Click(Sender: TObject);
begin
 CheckBox6Click(Sender);
end;

procedure TForm_Main.N6Click(Sender: TObject);
begin
  if (dm.ADO213user_ptr.AsString<>user_ptr) then
  begin
    ShowMessage('只能提交本人创建的单据！');
    Exit;
  end;
 DM.ADO213.Edit;
 dm.ADO213status.Value:=1;
 dm.ADO213submit_date.Value:=common.getsystem_date(dm.ADOQuery2,0);
 dm.ADO213user_ptr.Value:=StrToInt(user_ptr);
 dm.ADO213.Post;
 CheckBox6Click(Sender);
end;

procedure TForm_Main.N7Click(Sender: TObject);
begin
  if (((dm.ADO213user_ptr.AsString=user_ptr) and (StrToInt(vprev)=2)) or (StrToInt(vprev)=4)) then
  begin
    DM.ADO213.Edit;
    dm.ADO213status.Value:=0;
    dm.ADO213.Post;
    CheckBox6Click(Sender);
  end else
  begin
    ShowMessage('权限不足');
    exit;
  end;
end;

procedure TForm_Main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 if dm.ADO213status.Value=0 then
 begin
  if (dm.ADO213ORIG_REQUEST_DATE.Value-dDate)<15 then
  begin
   Grd1.Canvas.Font.Color:=clRed;
   Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
  begin
   Grd1.Canvas.Font.Color:=clAqua;
   Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
 end
 else
 if DM.ADO213status.Value=1 then //已提交状态
 begin
  Grd1.Canvas.Font.Color:=clGreen;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
 end
 else
 if DM.ADO213status.Value=3 then//已审核状态
 begin
  Grd1.Canvas.Font.Color:=clBlue;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
 end
 else
 begin
  Grd1.Canvas.Font.Color:=clBlack;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
 end;
end;

procedure TForm_Main.Grd1TitleClick(Column: TColumnEh);
begin
   if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.ADO213.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADO213.Sort:=Column.FieldName+' DESC';
  end;

  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end
  else
    edit1.SetFocus;
end;

procedure TForm_Main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          dm.ADO213.Filter:=field_name+' like ''%'+trim(edit1.text)+'%'''
//        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dm.ADO213.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
//        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end
    else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TForm_Main.BitBtn9Click(Sender: TObject);
var i:integer;
begin
  if Form_Condition.ShowModal=mrok then
  begin
    DM.ADO213.SQL.Text:=sSql;
    for i:=1 to Form_Condition.sgrid1.RowCount-2 do
    begin
    DM.ADO213.SQL.Text:=DM.ADO213.SQL.Text+Form_Condition.sgrid1.Cells[2,i];
    end;
    dm.ADO213.Parameters.ParamByName('dtpk1').Value:=Form_Condition.DateTimePicker1.Date;
    dm.ADO213.Parameters.ParamByName('dtpk2').Value:=Form_Condition.DateTimePicker2.Date;
    CheckBox6Click(Sender);
  end;
end;

procedure TForm_Main.PopupMenu1Popup(Sender: TObject);
begin
 if dm.ADO213.IsEmpty then
 begin
   n1.Enabled := true;
   n2.Enabled := false;
   n3.Enabled := false;
   N5.Enabled := False;
   n6.Enabled := false;
   n7.Enabled := false;
   n9.Enabled := False;
   N13.Enabled:=false;
   N18.Enabled:=false;
 end
 else
 begin
   N1.Enabled :=((StrToInt(vprev)=2) or (StrToInt(vprev)=4));
   n2.Enabled :=((StrToInt(vprev)=2) or (StrToInt(vprev)=4))and(dm.ADO213status.Value=0);
   n5.Enabled := True;
   n3.Enabled := N2.Enabled;
   n6.Enabled := N2.Enabled;
   n7.Enabled := ((StrToInt(vprev)=2) or (StrToInt(vprev)=4)) and (dm.ADO213status.Value=1);
   N9.Enabled := (StrToInt(vprev)=4) and (dm.ADO213status.Value=1);
   N13.Enabled:= (StrToInt(vprev)=4) and (dm.ADO213status.Value=3);
   N18.Enabled:= (StrToInt(vprev)=4) and (dm.ADO213status.Value=3);
 end;
end;

procedure TForm_Main.BitBtn3Click(Sender: TObject);
begin
 PopupMenu4.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_Main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(DM.ADO213.SQL.Text);
end;

procedure TForm_Main.FormShow(Sender: TObject);
begin
  if Form_Condition=nil then  Form_Condition:=TForm_Condition.Create(Application);
  dDate:=common.getsystem_date(dm.ADOQuery1,1);
//   with dm.adoquery2 do
//   begin
//    close;
//    sql.Clear;
//    sql.Add('select EMPLOYEE_PTR from data0073');
//    sql.Add('where rkey='+rkey73);
//    open;
//    user_ptr:=fieldbyname('employee_ptr').asstring;
//   end;
  sSql:=DM.ADO213.SQL.Text;
  if ((vprev='1') or (vprev='2')) then
  dm.ADO213.SQL.Text:=sSql+' and data0010.rkey in (SELECT customer_ptr from DATA0100 WHERE csi_ptr='+rkey73+') order by data0015.abbr_Name'
  else
  dm.ADO213.SQL.Text:=sSql+' order by data0015.abbr_Name';
  dm.ADO213.Parameters.ParamByName('dtpk1').Value:=getsystem_date(DM.ADOQuery1,1)-30;
  dm.ADO213.Parameters.ParamByName('dtpk2').Value:=getsystem_date(DM.ADOQuery1,1)+1;
  checkvar();
  dm.ADO213.Open;
  CheckBox6Click(Sender);
end;

procedure TForm_Main.N9Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的审核权限',mtinformation,[mbok],0);
  exit;
 end;
 DM.ADO213.Edit;
 dm.ADO213status.Value:=3;
 dm.ADO213audit_date.Value:=common.getsystem_date(dm.ADOQuery2,1);
 dm.ADO213audit_ptr.Value:=StrToInt(user_ptr);
 dm.ADO213.Post;
 CheckBox6Click(Sender);
end;

procedure TForm_Main.N11Click(Sender: TObject);
begin
Form_SoPrint:=TForm_SoPrint.Create(application);
Form_SoPrint.dtpk1.Date:=common.getsystem_date(dm.ADOQuery2,1)-1;
Form_SoPrint.dtpk2.Date:=common.getsystem_date(dm.ADOQuery2,1)+1;
Form_SoPrint.ShowModal;
Form_SoPrint.Free;
end;

procedure TForm_Main.BitBtn5Click(Sender: TObject);
begin
 PopupMenu3.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_Main.N12Click(Sender: TObject);
begin
 try
  Form_SoPrint:=TForm_SoPrint.Create(application);
  Form_SoPrint.ppReport1.Reset;
  Form_SoPrint.ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
        'much_soprint.rtm';
  Form_SoPrint.ppReport1.Template.LoadFromFile;
  Form_SoPrint.ppReport1.SaveAsTemplate:=true;
  Form_SoPrint.ppdesigner1.ShowModal;
 finally
  Form_SoPrint.Free;
 end;
end;

procedure TForm_Main.N13Click(Sender: TObject);
begin
 if messagedlg('你确定要退回此条已审核的订单吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
   if dm.ADO213UsedQuantity.AsInteger>0 then
   begin
    ShowMessage('已存在下单数量不能返审！');
    exit;
   end;
  DM.ADO213.Edit;
  dm.ADO213status.Value:=0;
  dm.ADO213.Post;
  CheckBox6Click(Sender);
 end;
end;

procedure TForm_Main.N14Click(Sender: TObject);
begin
if (StrToInt(vprev)=1) or (StrToInt(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end
 else
 begin
  if messagedlg('你确定要批量删除未提交的订单吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
   with DM.ADOQuery1 do
   begin
    Close;
    sql.Clear;
    sql.Add('delete from data0213 where status=0 and user_ptr='+user_ptr);
    ExecSQL;
   end;
   ShowMessage('删除成功!');
   CheckBox6Click(Sender);
  end;
 end;
end;

procedure TForm_Main.N15Click(Sender: TObject);
begin
if (StrToInt(vprev)=1) or (StrToInt(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end
 else
 begin
  if messagedlg('你确定要批量提交未提交的订单吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
   with DM.ADOQuery1 do
   begin
    Close;
    sql.Clear;
    sql.Add('update data0213 set status=1 where status=0 and user_ptr='+user_ptr);
    ExecSQL;
   end;
   ShowMessage('提交成功!');
   CheckBox6Click(Sender);
  end;
 end;
end;

procedure TForm_Main.N18Click(Sender: TObject);
begin
  if (StrToInt(vprev)=1) or (StrToInt(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end ;
  if StrToInt(vprev)=4 then
  begin
    if messagedlg('你确定要关闭预处理订单吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
    begin
      if (dm.ADO213status.AsInteger=2) then
      begin
        ShowMessage('状态是已下单!');
        Exit;
      end;
      with DM.ADOQuery1 do
      begin
       Close;
       sql.Clear;
       sql.Add('update data0213 set status=2,close_Ren='+user_ptr+' where status=3 and rkey='+dm.ADO213RKEY.AsString+'');
       ExecSQL;
      end;
      ShowMessage('关闭成功!');
      CheckBox6Click(Sender);
    end;
  end;
end;

procedure TForm_Main.Button1Click(Sender: TObject);
var iCount:Integer;
begin
  StringGrid1.RowCount := 1;
  for iCount := 0 to StringGrid1.ColCount - 1 do
    StringGrid1.Cells[iCount, 1] := '';
  StringGrid1.Update;
  with StringGrid1 do
  begin
    StringGrid1.ColCount:=15;
    StringGrid1.RowCount:=2;
    Cells[0,0]:='本厂编号';
    Cells[1,0]:='合同编号';
    Cells[2,0]:='客户物料号';
    Cells[3,0]:='客户型号';
    Cells[4,0]:='客户代码';
    Cells[5,0]:='出厂日期(计划交期)';
    Cells[6,0]:='交货日期(客户交期)';
    Cells[7,0]:='订单数量';
    Cells[8,0]:='价格';
    Cells[9,0]:='货币';
    Cells[10,0]:='合同发送日期(原始客户交期)';
    Cells[11,0]:='参考附注';
    Cells[12,0]:='工厂代码';
    Cells[13,0]:='关联原客户';
    Cells[14,0]:='是否含税(是/否)';
    Cells[0,1]:='操作说明：所有输入汉字标点请用半角；标题上日期的括号说明是对应销售订单而言，日期格式：2013-10-01。导入时请删除本列说明';
  end;
  Export_Grid_to_Excel(StringGrid1,Self.Caption,False);
end;

procedure TForm_Main.N16Click(Sender: TObject);
begin
  if (StrToInt(vprev)=1) or (StrToInt(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;
  if (StrToInt(vprev)=4) then
  begin
    if messagedlg('你确定要批量审核已提交的订单吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
    begin
      with DM.ADOQuery1 do
      begin
        Close;
        sql.Clear;
        sql.Add('update data0213 set status=3,audit_ptr='+user_ptr+', audit_date='+quotedstr(DateTimeToStr(common.getsystem_date(dm.ADOQuery2,1))));
        SQL.Add('from data0213 inner join data0010 on data0213.cust_code=data0010.cust_code');
        SQL.Add('where data0213.status=1 and data0010.rkey in (SELECT customer_ptr from DATA0100 WHERE csi_ptr='+rkey73+')');
        ExecSQL;
      end;
      ShowMessage('审核成功!');
      CheckBox6Click(Sender);
    end;
  end
  else
  begin
  messagedlg('对不起!您没有该程序的审核权限',mtinformation,[mbok],0);
  exit;
  end;
end;

procedure TForm_Main.CheckBox6Click(Sender: TObject);
begin
  dm.ADO213.Close;
  checkvar();
  dm.ADO213.Parameters.ParamByName('dtpk1').Value:=Form_Condition.DateTimePicker1.Date;
  dm.ADO213.Parameters.ParamByName('dtpk2').Value:=Form_Condition.DateTimePicker2.Date;
  DM.ADO213.open;
end;

procedure TForm_Main.N8Click(Sender: TObject);
var
  f:string;
  fs: TMemoryStream;
begin
  if (dm.ado213.FieldByName('PO_NUMBER').AsString<>'') then
  begin
    dm.ADOQuery2.Close;
    dm.ADOQuery2.SQL.Text:='select * from data0097 where CUSTOMER_PTR='+dm.ADO213rkey10.AsString+' and PO_NUMBER='''+dm.ADO213PO_NUMBER.AsString+'''';
    dm.ADOQuery2.Open;
    if not DM.ADOQuery2.IsEmpty then
    begin
      with dm.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('SELECT file_content,filename FROM Data0097 WHERE (file_content is not null) and RKEY =  '+dm.ADOQuery2.FieldByName('rkey').AsString);
        open;
      end;
      if dm.ADOQuery1.RecordCount=0 then
      begin
        ShowMessage('文档未上传');
        Abort;
      end;
      fs := TMemoryStream.Create;
      TBlobfield(dm.ADOQuery1.fieldbyname('file_content')).SaveToStream(fs);
      UnPackStream(fs);
      if not DirectoryExists(TmpFileDir) then
        if not CreateDir(TmpFileDir) then  raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
      f:=TmpFileDir+dm.ADOQuery1.fieldbyname('filename').AsString;
      fs.SaveToFile(f);
      fs.Free;
      ShellExecute(self.Handle,nil,pchar(f),nil,nil,SW_SHOWNORMAL);
    end;
  end;  
end;

procedure TForm_Main.Button2Click(Sender: TObject);
type
  PF = function (AConStr: string; ACallIDKey: string;Apage: integer = 1): Boolean;stdcall;
var
  LP: PF;
  hMod: THandle;
  P: Pointer;
  LGUID: TGUID;
  list1,list2:TStringList;
  i,iPage:Integer;
  iCallIDkey,strSQL,Rkey97,ANALYSIS_CODE_2,MANU_PART_DESC,iCallIDkey2:string;
  MsExcel,WBook,WSheet:OleVariant;
  sDate1,sDate2:string;
begin
  if frmSelectDate=nil then  frmSelectDate:=TfrmSelectDate.Create(Application);
  dDate:=common.getsystem_date(dm.ADOQuery1,1);
  frmSelectDate.DateTimePicker1.Date:=dDate-1;
  frmSelectDate.DateTimePicker2.Date:=dDate;
  if frmSelectDate.ShowModal=mrok then
  begin
//查询b2b_hwapi接口rkeyid
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Text:='select * from b2b_hwapi inner join b2b_app on b2b_hwapi.APPIDKey=b2b_app.IDKey'
  +' where b2b_hwapi.APIName=''findPoLineList'' and b2b_app.APPName=''东莞正式''';
//  +' where b2b_hwapi.APIName=''findPoLineList'' and b2b_app.APPName=''测试用''';
  dm.ADOQuery1.Open;
  if Not dm.ADOQuery1.IsEmpty then sPoAPI:=DM.ADOQuery1.FieldBYName('IDKey').AsString else sPoAPI:='';
  if (sPoAPI='') then
  begin
    ShowMessage('华为API接口表不存在数据');
    Exit;
  end;
//  ShowMessage('1--ok!');
//新增B2B_HWAPI_Call调用表
//  dm.ADOQuery1.Close;
//  dm.ADOQuery1.SQL.Text:='delete B2B_Call_Response';
//  DM.ADOQuery1.ExecSQL;
  CreateGUID(LGUID);
  dm.ADOQuery1.Close;
  DM.ADOQuery1.SQL.Text:='insert into B2B_HWAPI_Call(IDKey,APIIDKey) values(:IDKey,:APIIDKey) ';
  DM.ADOQuery1.SQL.Add('select scope_identity() as fRet');
  dm.ADOQuery1.Parameters.ParamByName('IDKey').Value:=GUIDToString(LGUID);
  dm.ADOQuery1.Parameters.ParamByName('APIIDKey').Value:=sPoAPI;
  dm.ADOQuery1.Open;
  DM.ADOQuery2.close;
  DM.ADOQuery2.SQL.Text:='select Top 1 * from B2B_HWAPI_Call order by rkey desc';
  dm.ADOQuery2.Open;
  iCallIDkey:=DM.ADOQuery2.FieldBYName('IDKey').AsString;
//新增dbo.B2B_Call_Request调用参数表
  try
    sDate1:=FormatDateTime('yyyy-MM-dd',frmSelectDate.DateTimePicker1.DateTime);
    sDate2:=FormatDateTime('yyyy-MM-dd',frmSelectDate.DateTimePicker2.DateTime);

//    list1:=TStringList.Create;
//    list1.CommaText:='poSubType,shipmentStatus,businessType,statusType,colTaskOrPoStatus,poStatus,orgId,publishDateStart,publishDateEnd';
//    list2:=TStringList.Create;
//    list2.CommaText:='P,NEW,all,COL_TASK_STATUS,huaweiPublishOrder,before_signe_back,218,'+sDate1+','+sDate2+'';//华为技术服务有限公司
    list1:=TStringList.Create;
    list1.CommaText:='poSubType,shipmentStatus,businessType,statusType,colTaskOrPoStatus,orgId,publishDateStart,publishDateEnd,businessMode';
    list2:=TStringList.Create;
    list2.CommaText:='P,NEW,all,COL_TASK_STATUS,huaweiPublishOrder,218,'+sDate1+','+sDate2+',VCI-PO';//华为技术服务有限公司
    for i :=0  to list1.Count-1 do
    begin
      CreateGUID(LGUID);
      dm.ADOQuery1.Close;
      DM.ADOQuery1.SQL.Text:='insert into B2B_Call_Request(IDKey,CallIDkey,ParamIDkey,ParamName,ParamValue) values(:IDKey,:CallIDkey,:ParamIDkey,:ParamName,:ParamValue)';
      dm.ADOQuery1.Parameters.ParamByName('IDKey').Value:=GUIDToString(LGUID);
      dm.ADOQuery1.Parameters.ParamByName('CallIDkey').Value:=iCallIDkey;
//      ShowMessage(GetIDKey(list1[i]));
      dm.ADOQuery1.Parameters.ParamByName('ParamIDkey').Value:=GetIDKey(list1[i]);
//      ShowMessage(list1[i]);
      DM.ADOQuery1.Parameters.ParamByName('ParamName').Value:=list1[i];
//      ShowMessage(list2[i]);
      DM.ADOQuery1.Parameters.ParamByName('ParamValue').Value:=list2[i];
      dm.ADOQuery1.ExecSQL;
    end;
  finally
    list1.Free;
    list2.Free;
  end;
//调用接口
  try
//    ShowMessage('2--ok!');
    screen.Cursor:=crSQLWait;
    P := nil;
    hMod := LoadLibrary('B2BCallDll.Dll');
    P := GetProcAddress(hMod,'CallAPI');
    if P = nil then ShowMessage('调用失效，请再次点击调用');
    LP := PF(P);
    try
      iPage:=StrToInt(frmSelectDate.ComboBox1.Text);
//        ShowMessage(iCallIDkey);
//        ShowMessage(IntToStr(iPage));
//        ShowMessage('3--ok!');
      if LP(DM.ADOConnection1.ConnectionString,iCallIDkey,iPage) then
      begin
    //调用成功之后处理
//        ShowMessage('4--ok!');
        DM.adoB2B_Response.Close;
        dm.adoB2B_Response.Parameters.ParamByName('Rkey').Value:=iCallIDkey;
        DM.adoB2B_Response.Open;// --把所有数据行转列再处理。
//        ShowMessage('5--ok!');
        if messagedlg('已完成接收【'+IntToStr(dm.adoB2B_Response.RecordCount)+'】条记录，确定全部导入吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
        begin
            strSQL:='if exists (select * from tempdb..sysobjects where id=object_id(''#TempDBExcel'')) drop table #TempDBExcel'
            +#13+' CREATE TABLE #TempDBExcel(RKEY int IDENTITY(1,1) NOT NULL,POCode varchar(30) not null,'
            +#13+' MANU_PART_DESC varchar(80) null,Qry int null,ANALYSIS_CODE_2 varchar(10) null,sAddress varchar(100) null)'
            +#13+' CREATE UNIQUE INDEX [RKEY] ON #TempDBExcel ([RKEY]) ON [PRIMARY]';
            if (ExecSql(DM.Adotmp,strSQL)) then
            begin
              dm.adoB2B_Response.First;
              while not dm.adoB2B_Response.Eof do
              begin
                if (Trim(dm.adoB2B_Response.fieldByName('MANU_PART_DESC').AsString)='') then MANU_PART_DESC:='='
                else MANU_PART_DESC:=Trim(dm.adoB2B_Response.fieldByName('MANU_PART_DESC').AsString);
                if (Trim(dm.adoB2B_Response.fieldByName('ANALYSIS_CODE_2').AsString)='') then ANALYSIS_CODE_2:='='
                else ANALYSIS_CODE_2:=Trim(dm.adoB2B_Response.fieldByName('ANALYSIS_CODE_2').AsString);
                DM.ADOQuery2.Close;
                dm.ADOQuery2.SQL.Clear;
                dm.ADOQuery2.SQL.Text:='select top 1 Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0025.ORIG_CUSTOMER,Data0025.ANALYSIS_CODE_2'
                                      +' from data0025 '
                                      +' where (PARENT_PTR IS NULL) and Data0025.ONHOLD_SALES_FLAG=0 and'
                                      +' Data0025.MANU_PART_DESC='''+MANU_PART_DESC+''' and '
                                      +' RIGHT(Data0025.ANALYSIS_CODE_2,2)=''.'+ANALYSIS_CODE_2+''' and'
                                      +' Left(data0025.MANU_PART_NUMBER,2)=''BM'''
                                      +' order by data0025.rkey desc ';
                dm.ADOQuery2.Open;
                if not dm.ADOQuery2.IsEmpty then
                begin
                //客户订单号97
                  dm.Adotmp2.Close;
                  dm.Adotmp2.SQL.Text:='select * from data0097 where PO_NUMBER='''+trim(dm.adoB2B_Response.fieldByName('POCode').AsString)+'''';
                  dm.Adotmp2.Open;
                  if dm.Adotmp2.IsEmpty then
                  begin
                    dm.Adotmp.Close;
                    dm.Adotmp.SQL.Text:=' insert into data0097 (PO_NUMBER,CUSTOMER_PTR,PO_DATE,OPEN_SOS) values (:PO_NUMBER,:CUSTOMER_PTR,:PO_DATE,:OPEN_SOS)';
                    dm.Adotmp.SQL.Add('select scope_identity() as fRet');
                    dm.Adotmp.Parameters.ParamByName('PO_NUMBER').Value:=trim(dm.adoB2B_Response.fieldByName('POCode').AsString);
                    dm.Adotmp.Parameters.ParamByName('CUSTOMER_PTR').Value:=3;//6004客户代码Rkey
                    dm.Adotmp.Parameters.ParamByName('PO_DATE').Value:=dDate;
                    dm.Adotmp.Parameters.ParamByName('OPEN_SOS').Value:=0;
                    dm.Adotmp.Open;
                    Rkey97:=dm.Adotmp.FieldByName('fRet').AsString;
                  end else
                  begin
                    Rkey97:=dm.Adotmp2.FieldByName('Rkey').AsString;
                  end;
                //检测该型号及物料号在销售订单中否已存在客户订单为‘后补’
                  dm.Adotmp2.Close;
                  dm.Adotmp2.SQL.Text:='SELECT top 1 data0060.RKEY FROM dbo.Data0060 INNER JOIN dbo.Data0097 ON '
                  +' dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY inner join Data0025 on data0060.CUST_PART_PTR=Data0025.RKEY'
                  +' WHERE Data0097.PO_NUMBER like ''%后补%'' and Data0025.MANU_PART_DESC='''+Trim(dm.ADOQuery2.FieldByName('MANU_PART_DESC').AsString)+''' '
                  +' and  RIGHT(Data0025.ANALYSIS_CODE_2,2)=''.'+ANALYSIS_CODE_2+''' and Left(data0025.MANU_PART_NUMBER,2)=''BM'' and (data0060.STATUS=1 or data0060.STATUS=6)';
                  DM.Adotmp2.Open;
                  if not dm.Adotmp2.IsEmpty then
                  begin
                    ShowMessage('型号['+dm.ADOQuery2.FieldByName('MANU_PART_DESC').AsString+']客户物料号['+dm.ADOQuery2.FieldByName('ANALYSIS_CODE_2').AsString+']在客户订单号中已存在[后补]!');
                  end;
                //预处理213表
                  dm.Adotmp2.Close;
                  dm.Adotmp2.SQL.Text:='select * from data0213 where lineLocationId='''+dm.adoB2B_Response.fieldByName('lineLocationId').AsString+'''';
                  dm.Adotmp2.Open;
                  if dm.Adotmp2.IsEmpty then
                  begin
                   dm.ADO213.Append;
                   DM.ADO213MANU_PART_NUMBER.Value:= dm.ADOQuery2.FieldByName('MANU_PART_NUMBER').AsString;
                   dm.ADO213cust_code.Value:='6004';
                   DM.ADO213CURR_CODE.Value:= 'RMB';
                   DM.ADO213MANU_PART_DESC.Value:= dm.ADOQuery2.FieldByName('MANU_PART_DESC').AsString;
                   dm.ADO213ANALYSIS_CODE_2.Value:=dm.ADOQuery2.FieldByName('ANALYSIS_CODE_2').AsString;
                   DM.ADO213user_ptr.AsString:=user_ptr;
                   DM.ADO213so_oldnew.Value:='旧单';
                   dm.ADO213so_style.Value:=0; //正式订单
                   dm.ADO213PO_NUMBER.Value:=trim(dm.adoB2B_Response.fieldByName('POCode').AsString);
                   dm.ADO213PARTS_ORDERED.Value:=dm.adoB2B_Response.fieldByName('Qry').AsInteger;
                   dm.ADO213PART_PRICE.Value:=0;
                   dm.ADO213orig_customer.Value:=dm.ADOQuery2.FieldByName('ORIG_CUSTOMER').AsString;
                   DM.ADO213submit_date.Value:=dDate;
                   dm.ADO213PO_DATE.Value:=dDate;
                   DM.ADO213EDI_FLAG_FOR_INVOICE.Value:=1;  //不含税
                   if (Pos('深南',dm.adoB2B_Response.fieldByName('sAddress').AsString)>0) then
                     DM.ADO213REFERENCE_NUMBER.Value:='VMI 深南'
                   else
                     DM.ADO213REFERENCE_NUMBER.Value:='VMI';
                   DM.ado213WAREHOUSE_CODE.Value:='D0002';
                   DM.ADO213ORIG_SCHED_SHIP_DATE.Value:=dDate+12;
                   DM.ADO213ORIG_REQUEST_DATE.Value:=dDate+12;
                   DM.ado213lineLocationId.Value:=dm.adoB2B_Response.fieldByName('lineLocationId').AsString;//签返PO号
                   DM.ADO213.Post;
                  end;
                end else
                begin
                  DM.Adotmp.Close;
                  DM.Adotmp.SQL.Clear;
                  DM.Adotmp.SQL.Add('insert into #TempDBExcel ([POCode],[MANU_PART_DESC],[Qry],[ANALYSIS_CODE_2],[sAddress]) values(:POCode,:MANU_PART_DESC,:Qry,:ANALYSIS_CODE_2,:sAddress)');
                  DM.Adotmp.Parameters.ParamByName('POCode').Value:=dm.adoB2B_Response.fieldByName('POCode').AsString;
                  DM.Adotmp.Parameters.ParamByName('MANU_PART_DESC').Value:=dm.adoB2B_Response.fieldByName('MANU_PART_DESC').AsString;
                  DM.Adotmp.Parameters.ParamByName('Qry').Value:=dm.adoB2B_Response.fieldByName('Qry').AsInteger;
                  DM.Adotmp.Parameters.ParamByName('ANALYSIS_CODE_2').Value:=dm.adoB2B_Response.fieldByName('ANALYSIS_CODE_2').AsString;
                  DM.Adotmp.Parameters.ParamByName('sAddress').Value:=dm.adoB2B_Response.fieldByName('sAddress').AsString;
                  DM.Adotmp.ExecSQL;
                end;
                dm.adoB2B_Response.Next;
              end;
              //处理未能导入的数据
              DM.Adotmp.Close;
              DM.Adotmp.SQL.Clear;
              DM.Adotmp.SQL.Add('select * from #TempDBExcel');
              DM.Adotmp.Open;
              if DM.Adotmp.RecordCount>=1 then
              begin
                if (Application.MessageBox('数据已经导入完成！,部分数据因为类型不符或是其它原因，导入不成功，是否需要导出没有处理的记录请单？', '操作提示', MB_OKCANCEL + MB_ICONINFORMATION) = IDCANCEL) then
                begin
                  DM.ADOQuery1.Close;
                  DM.ADOQuery1.SQL.Clear;
                  DM.ADOQuery1.SQL.Add('if exists(select 1 from tempdb..sysobjects where xtype=''u'' and name like ''#TempDB%'') drop table #TempDBExcel');
                  DM.ADOQuery1.ExecSQL;
                  screen.Cursor:=crDefault;
                  Exit;
                end;
                with dm.ADOQuery1 do
                begin
                  Close;
                  SQL.Clear;
                  sql.Add('select * from #TempDBExcel');
                  Open;
                  ShowADOQueryDataOnStringGrid(dm.ADOQuery1,StringGrid1);
                  Export_Grid_to_Excel(StringGrid1,Application.Title);
                end;
              end
              else
              begin
                ShowMessage('数据已全部处理完毕！');
              end;
            end else
            begin
              Messagedlg('创建EXCEL错误，请联系管理员！',mtinformation,[mbok],0);
              DM.ADOQuery1.Close;
              DM.ADOQuery1.SQL.Clear;
              DM.ADOQuery1.SQL.Add('if exists(select 1 from tempdb..sysobjects where xtype=''u'' and name like ''#TempDB%'') drop table #TempDBExcel');
              DM.ADOQuery1.ExecSQL;
              screen.Cursor:=crDefault;
              Exit;
            end;
        end;
      end;
    finally
      screen.Cursor:=crDefault;
      CheckBox6Click(Sender);
    end;
    dm.ADOQuery1.Close;
    dm.ADOQuery1.SQL.Text:='delete B2B_Call_Response where CallIDKey='''+iCallIDkey+'''';
    DM.ADOQuery1.ExecSQL;
  except
   on E: Exception do
    begin
//      dm.ADOConnection1.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
      screen.Cursor:=crDefault;
      exit;
    end;
//    ShowMessage('调用华为接口失败');
//    screen.Cursor:=crDefault;
  end;
  end;
end;

procedure TForm_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  dm.ADOQuery1.Close;
//  dm.ADOQuery1.SQL.Text:='delete from B2B_Call_Response';
//  DM.ADOQuery1.ExecSQL;
end;

procedure TForm_Main.N20Click(Sender: TObject);
type
  PF = function (AConStr: string; ACallIDKey: string;Apage: integer = 1): Boolean;stdcall;
var
  LP: PF;
  hMod: THandle;
  P: Pointer;
  LGUID: TGUID;
  list1,list2:TStringList;
  i:Integer;
  iCallIDkey:string;
begin
  if (Trim(dm.ADO213stroperateType.AsString)='') then
  begin
    ShowMessage('华为签返PO号不存在，请确定该记录是导入的PO！');
    Exit;
  end;
  if (dm.ADO213operateType.AsString='1') then
  begin
    ShowMessage('该记录已签返！');
    Exit;
  end;
  dDate:=common.getsystem_date(dm.ADOQuery1,1);
//查询b2b_hwapi接口rkeyid
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Text:='select * from b2b_hwapi inner join b2b_app on b2b_hwapi.APPIDKey=b2b_app.IDKey'
  +' where b2b_hwapi.APIName=''signBackColTaskListForPOList'' and b2b_app.APPName=''东莞正式''';
//  +' where b2b_hwapi.APIName=''signBackColTaskListForPOList'' and b2b_app.APPName=''测试用''';
  dm.ADOQuery1.Open;
  if Not dm.ADOQuery1.IsEmpty then sPoAPI:=DM.ADOQuery1.FieldBYName('IDKey').AsString else sPoAPI:='';
  if (sPoAPI='') then
  begin
    ShowMessage('华为API接口表不存在数据');
    Exit;
  end;
//新增B2B_HWAPI_Call调用表
  CreateGUID(LGUID);
  dm.ADOQuery1.Close;
  DM.ADOQuery1.SQL.Text:='insert into B2B_HWAPI_Call(IDKey,APIIDKey) values(:IDKey,:APIIDKey) ';
  DM.ADOQuery1.SQL.Add('select scope_identity() as fRet');
  dm.ADOQuery1.Parameters.ParamByName('IDKey').Value:=GUIDToString(LGUID);
  dm.ADOQuery1.Parameters.ParamByName('APIIDKey').Value:=sPoAPI;
  dm.ADOQuery1.Open;
  DM.ADOQuery2.close;
  DM.ADOQuery2.SQL.Text:='select Top 1 * from B2B_HWAPI_Call order by rkey desc';
  dm.ADOQuery2.Open;
  iCallIDkey:=DM.ADOQuery2.FieldBYName('IDKey').AsString;
//新增dbo.B2B_Call_Request调用参数表
  try
    list1:=TStringList.Create;
    list1.CommaText:='lineLocationId,instanceId,businessType,operateType';
    list2:=TStringList.Create;
    list2.CommaText:=''+dm.ADO213lineLocationId.AsString+',1,new_po,accept';
    for i :=0  to list1.Count-1 do
    begin
      CreateGUID(LGUID);
      dm.ADOQuery1.Close;
      DM.ADOQuery1.SQL.Text:='insert into B2B_Call_Request(IDKey,CallIDkey,ParamIDkey,ParamName,ParamValue) values(:IDKey,:CallIDkey,:ParamIDkey,:ParamName,:ParamValue)';
      dm.ADOQuery1.Parameters.ParamByName('IDKey').Value:=GUIDToString(LGUID);
      dm.ADOQuery1.Parameters.ParamByName('CallIDkey').Value:=iCallIDkey;
      dm.ADOQuery1.Parameters.ParamByName('ParamIDkey').Value:=GetIDKey(list1[i]);
      DM.ADOQuery1.Parameters.ParamByName('ParamName').Value:=list1[i];
      DM.ADOQuery1.Parameters.ParamByName('ParamValue').Value:=list2[i];
      dm.ADOQuery1.ExecSQL;
    end;
  finally
    list1.Free;
    list2.Free;
  end;
//调用接口
  try
    screen.Cursor:=crSQLWait;
    P := nil;
    hMod := LoadLibrary('B2BCallDll.Dll');
    P := GetProcAddress(hMod,'CallAPI');
    if P = nil then ShowMessage('调用失效，请再次点击调用');
    LP := PF(P);
    try
      if LP(DM.ADOConnection1.ConnectionString,iCallIDkey,0) then
      begin
        DM.Adotmp.Close;
        dm.Adotmp.SQL.Text:='select * from dbo.B2B_Call_Response where CallIDKey='''+iCallIDkey+''' and ParamName=''code'' and ParamValue=''00000'' order by seqno';
        dm.Adotmp.Open;
    //调用成功之后处理签返标识为已签返
        if not dm.Adotmp.IsEmpty then
        begin
          dm.Adotmp2.Close;
          DM.Adotmp2.SQL.Text:='update data0213 set operateType=1 where RKEY='+dm.ADO213RKEY.AsString;
          dm.Adotmp2.ExecSQL;
          ShowMessage('签返成功！');
        end;
      end;
    finally
      CheckBox6Click(Sender);
      screen.Cursor:=crDefault;
    end;
    dm.ADOQuery1.Close;
    dm.ADOQuery1.SQL.Text:='delete B2B_Call_Response where CallIDKey='''+iCallIDkey+'''';
    DM.ADOQuery1.ExecSQL;
  except
    ShowMessage('调用华为接口失败');
    screen.Cursor:=crDefault;
  end;
end;

procedure TForm_Main.N21Click(Sender: TObject);
type
  PF = function (AConStr: string; ACallIDKey: string;Apage: integer = 1): Boolean;stdcall;
var
  LP: PF;
  hMod: THandle;
  P: Pointer;
  LGUID: TGUID;
  list1,list2:TStringList;
  i:Integer;
  iCallIDkey:string;
  row:string;
  NewDate:TDateTime;
begin
  if (Trim(dm.ADO213stroperateType.AsString)='') then
  begin
    ShowMessage('华为签返PO号不存在，请确定该记录是导入的PO！');
    Exit;
  end;
  dDate:=common.getsystem_date(dm.ADOQuery1,1);
//查询b2b_hwapi接口rkeyid
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Text:='select * from b2b_hwapi inner join b2b_app on b2b_hwapi.APPIDKey=b2b_app.IDKey'
  +' where b2b_hwapi.APIName=''signBackColTaskListForPOList'' and b2b_app.APPName=''东莞正式''';
//  +' where b2b_hwapi.APIName=''applyPromiseDateChange'' and b2b_app.APPName=''测试用''';
  dm.ADOQuery1.Open;
  if Not dm.ADOQuery1.IsEmpty then sPoAPI:=DM.ADOQuery1.FieldBYName('IDKey').AsString else sPoAPI:='';
  if (sPoAPI='') then
  begin
    ShowMessage('华为API接口表不存在数据');
    Exit;
  end;
//新增B2B_HWAPI_Call调用表
  CreateGUID(LGUID);
  dm.ADOQuery1.Close;
  DM.ADOQuery1.SQL.Text:='insert into B2B_HWAPI_Call(IDKey,APIIDKey) values(:IDKey,:APIIDKey) ';
  DM.ADOQuery1.SQL.Add('select scope_identity() as fRet');
  dm.ADOQuery1.Parameters.ParamByName('IDKey').Value:=GUIDToString(LGUID);
  dm.ADOQuery1.Parameters.ParamByName('APIIDKey').Value:=sPoAPI;
  dm.ADOQuery1.Open;
  DM.ADOQuery2.close;
  DM.ADOQuery2.SQL.Text:='select Top 1 * from B2B_HWAPI_Call order by rkey desc';
  dm.ADOQuery2.Open;
  iCallIDkey:=DM.ADOQuery2.FieldBYName('IDKey').AsString;
  //弹出窗口输入日期
  if InputQuery('日期输入', '请输入新的回复交期:      ',row) then  //修正点cancel按钮也保存的BUG
  begin
    if not TryStrToDate(row,NewDate) then
    begin
      ShowMessage('日期转换失败，请确定日期格式是yyyy-mm-dd');
      Exit;
    end;
  end else Exit;
//新增dbo.B2B_Call_Request调用参数表
  try
    list1:=TStringList.Create;
    list1.CommaText:='instanceId,poNumber,lineLocationId,typeLookupCode,promiseDateStr,promiseDateChangeReason';
    list2:=TStringList.Create;
    list2.CommaText:='1,'+dm.ADO213PO_NUMBER.AsString+','+dm.ADO213lineLocationId.AsString+',2,'+row+',新回复交期';
    for i :=0  to list1.Count-1 do
    begin
      CreateGUID(LGUID);
      dm.ADOQuery1.Close;
      DM.ADOQuery1.SQL.Text:='insert into B2B_Call_Request(IDKey,CallIDkey,ParamIDkey,ParamName,ParamValue) values(:IDKey,:CallIDkey,:ParamIDkey,:ParamName,:ParamValue)';
      dm.ADOQuery1.Parameters.ParamByName('IDKey').Value:=GUIDToString(LGUID);
      dm.ADOQuery1.Parameters.ParamByName('CallIDkey').Value:=iCallIDkey;
      dm.ADOQuery1.Parameters.ParamByName('ParamIDkey').Value:=GetIDKey(list1[i]);
      DM.ADOQuery1.Parameters.ParamByName('ParamName').Value:=list1[i];
      DM.ADOQuery1.Parameters.ParamByName('ParamValue').Value:=list2[i];
      dm.ADOQuery1.ExecSQL;
    end;
  finally
    list1.Free;
    list2.Free;
  end;
//调用接口
  try
    screen.Cursor:=crSQLWait;
    P := nil;
    hMod := LoadLibrary('B2BCallDll.Dll');
    P := GetProcAddress(hMod,'CallAPI');
    if P = nil then ShowMessage('调用失效，请再次点击调用');
    LP := PF(P);
    try
      if LP(DM.ADOConnection1.ConnectionString,iCallIDkey,0) then
      begin
    //调用成功之后处理签返标识为已签返
        dm.Adotmp2.Close;
        DM.Adotmp2.SQL.Text:='update data0213 set EditREDATEType=1,New_REDATE='''+row+''' where RKEY='+dm.ADO213RKEY.AsString;
        dm.Adotmp2.ExecSQL;
        ShowMessage('提交修改交期成功！');
      end;
    finally
      CheckBox6Click(Sender);
      screen.Cursor:=crDefault;
    end;
    dm.ADOQuery1.Close;
    dm.ADOQuery1.SQL.Text:='delete B2B_Call_Response where CallIDKey='''+iCallIDkey+'''';
    DM.ADOQuery1.ExecSQL;
  except
    ShowMessage('调用华为接口失败');
    screen.Cursor:=crDefault;
  end;
end;

procedure TForm_Main.N22Click(Sender: TObject);
type
  PF = function (AConStr: string; ACallIDKey: string;Apage: integer = 1): Boolean;stdcall;
var
  LP: PF;
  hMod: THandle;
  P: Pointer;
  LGUID: TGUID;
  list1,list2:TStringList;
  i:Integer;
  iCallIDkey:string;
  row:string;
  NewDate:TDateTime;
begin
  if (Trim(dm.ADO213stroperateType.AsString)='') then
  begin
    ShowMessage('华为签返PO号不存在，请确定该记录是导入的PO！');
    Exit;
  end;
  dDate:=common.getsystem_date(dm.ADOQuery1,1);
//查询b2b_hwapi接口rkeyid
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Text:='select * from b2b_hwapi inner join b2b_app on b2b_hwapi.APPIDKey=b2b_app.IDKey'
  +' where b2b_hwapi.APIName=''findColTaskList'' and b2b_app.APPName=''东莞正式''';
//  +' where b2b_hwapi.APIName=''findColTaskList'' and b2b_app.APPName=''测试用''';
  dm.ADOQuery1.Open;
  if Not dm.ADOQuery1.IsEmpty then sPoAPI:=DM.ADOQuery1.FieldBYName('IDKey').AsString else sPoAPI:='';
  if (sPoAPI='') then
  begin
    ShowMessage('华为API接口表不存在数据');
    Exit;
  end;
//新增B2B_HWAPI_Call调用表
  CreateGUID(LGUID);
  dm.ADOQuery1.Close;
  DM.ADOQuery1.SQL.Text:='insert into B2B_HWAPI_Call(IDKey,APIIDKey) values(:IDKey,:APIIDKey) ';
  DM.ADOQuery1.SQL.Add('select scope_identity() as fRet');
  dm.ADOQuery1.Parameters.ParamByName('IDKey').Value:=GUIDToString(LGUID);
  dm.ADOQuery1.Parameters.ParamByName('APIIDKey').Value:=sPoAPI;
  dm.ADOQuery1.Open;
  DM.ADOQuery2.close;
  DM.ADOQuery2.SQL.Text:='select Top 1 * from B2B_HWAPI_Call order by rkey desc';
  dm.ADOQuery2.Open;
  iCallIDkey:=DM.ADOQuery2.FieldBYName('IDKey').AsString;
//新增dbo.B2B_Call_Request调用参数表
  try
    list1:=TStringList.Create;
    list1.CommaText:='instanceId,lineLocationId';
    list2:=TStringList.Create;
    list2.CommaText:='1,'+dm.ADO213lineLocationId.AsString+'';
    for i :=0  to list1.Count-1 do
    begin
      CreateGUID(LGUID);
      dm.ADOQuery1.Close;
      DM.ADOQuery1.SQL.Text:='insert into B2B_Call_Request(IDKey,CallIDkey,ParamIDkey,ParamName,ParamValue) values(:IDKey,:CallIDkey,:ParamIDkey,:ParamName,:ParamValue)';
      dm.ADOQuery1.Parameters.ParamByName('IDKey').Value:=GUIDToString(LGUID);
      dm.ADOQuery1.Parameters.ParamByName('CallIDkey').Value:=iCallIDkey;
      dm.ADOQuery1.Parameters.ParamByName('ParamIDkey').Value:=GetIDKey(list1[i]);
      DM.ADOQuery1.Parameters.ParamByName('ParamName').Value:=list1[i];
      DM.ADOQuery1.Parameters.ParamByName('ParamValue').Value:=list2[i];
      dm.ADOQuery1.ExecSQL;
    end;
  finally
    list1.Free;
    list2.Free;
  end;
//调用接口
  try
    screen.Cursor:=crSQLWait;
    P := nil;
    hMod := LoadLibrary('B2BCallDll.Dll');
    P := GetProcAddress(hMod,'CallAPI');
    if P = nil then ShowMessage('调用失效，请再次点击调用');
    LP := PF(P);
    try
      if LP(DM.ADOConnection1.ConnectionString,iCallIDkey,0) then
      begin
        DM.Adotmp.Close;
        dm.Adotmp.SQL.Text:='select * from dbo.B2B_Call_Response where CallIDKey='''+iCallIDkey+''' and ParamName=''changeAfterContent'' order by seqno';
        dm.Adotmp.Open;
    //调用成功之后处理
        if not dm.Adotmp.IsEmpty then
        begin
          dm.Adotmp2.Close;
          DM.Adotmp2.SQL.Text:='update data0213 set ORIG_SCHED_SHIP_DATE='''+dm.Adotmp.fieldBYName('ParamValue').AsString+''','
          +'ORIG_REQUEST_DATE='''+dm.Adotmp.fieldBYName('ParamValue').AsString+''' where RKEY='+dm.ADO213RKEY.AsString;
          dm.Adotmp2.ExecSQL;
          ShowMessage('刷新交期成功！');
        end;
      end;
    finally
      CheckBox6Click(Sender);
      screen.Cursor:=crDefault;
    end;
    dm.ADOQuery1.Close;
    dm.ADOQuery1.SQL.Text:='delete B2B_Call_Response where CallIDKey='''+iCallIDkey+'''';
    DM.ADOQuery1.ExecSQL;
  except
    ShowMessage('调用华为接口失败');
    screen.Cursor:=crDefault;
  end;
end;

end.
