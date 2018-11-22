 unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DBCtrls,
  Menus,adodb, DB, DBGridEh, ExtCtrls;

type
  TFrm_main = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    N3: TMenuItem;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Label2: TLabel;
    dbgrid1: TDBGridEh;
    N2: TMenuItem;
    N44: TMenuItem;
    N4: TMenuItem;
    BitBtn2: TBitBtn;
    BOM1: TMenuItem;
    N5: TMenuItem;
    BitBtn4: TBitBtn;
    DBMemo1: TDBMemo;
    N6: TMenuItem;
    N7: TMenuItem;
    Splitter1: TSplitter;
    Label1: TLabel;
    Panel2: TPanel;
    N8: TMenuItem;
    lbl1: TLabel;
    lbl2: TLabel;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    mniN17: TMenuItem;
    mniBOM2: TMenuItem;
    mni_Mrtls: TMenuItem;
    rg1: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure dbgrid1TitleClick(Column: TColumnEh);
    procedure BtQryClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BOM1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbgrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mniBOM2Click(Sender: TObject);
    procedure mni_MrtlsClick(Sender: TObject);
    procedure rg1Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsSearch:string;
   procedure init;
  public
   vdata0017_1,vdata0017_2 :OleVariant;
  end;

var
  Frm_main: TFrm_main;

implementation
uses DM_u,common,Frm_Edit_u,Frm_QrySet_u, Frm_BOM_u,Frm_order_u,Frm_QryOrder_u,//ProcInfo,
  MatPrice, frm_fatherparts_u,Frm_tree_u, Frm_New_u, change,UBOMMtrl,UAllMtrls;

{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin


user_ptr:='5';
vprev:='4';
rkey73 :='414';
//  dm.ADOCon.open;

 if not App_init_2(dm.ADOCon) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
  exit;
 end;


  self.Caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
  rg1.ItemIndex:=-1;
end;

procedure TFrm_main.init;
begin
  field_name := dbgrid1.Columns[0].FieldName;
  PreColumn := dbgrid1.Columns[0];
  dbgrid1.Columns[0].Title.Color := clred ;

  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='SELECT dbo.Data0034.RKEY FROM dbo.Data0005 INNER JOIN '+
                   'dbo.Data0034 ON dbo.Data0005.EMPLOYEE_ID = dbo.Data0034.RKEY where data0005.rkey='+user_ptr;
  DM.Tmp.Open;
  sSql:=DM.D08.SQL.Text;
  DM.D08.SQL.Text:=DM.D08.SQL.Text + ' where A.Dept_ptr='+DM.Tmp.Fields[0].AsString+' order by A.prod_code ';
  DM.Tmp.Close;
  dm.D08.Prepared;
  DM.D08.Open;
  Label1.Caption := '当前显示数目：' + IntToStr(DM.D08.RecordCount);
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
  if Frm_QrySet <> nil then Frm_QrySet.Free;
  if Frm_QryOrder <> nil then Frm_QryOrder.Free;
  Application.Terminate;
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=(vprev='2')  or (vprev='4') or (vprev='3');
  bom1.enabled:= (vprev='2') or (vprev='4') or (vprev='3');
  N2.Enabled:=not DM.D08.IsEmpty and ((vprev='2')  or (vprev='4') or (vprev='3'));
  N3.Enabled:=N2.Enabled;
  N4.Enabled:=not DM.D08.IsEmpty;
  N15.Enabled:=not DM.D08.IsEmpty;
  N9.Enabled := False;
  N9.Enabled:=(not DM.D08.IsEmpty) and (N1.Enabled);
  N12.Enabled := False;
  N12.Enabled:=not DM.D08.IsEmpty;
  BOM1.Enabled:=not DM.D08.IsEmpty;
  N6.Enabled := True;
  N11.Enabled := False;
  if not DM.D08.IsEmpty then
  begin
    if dm.D08.FieldByName('ttype').Value = 0 then n11.Enabled := true;
  end;
end;


procedure TFrm_main.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift)  and  (Key=86) then
   showmessage(DM.D08.SQL.Text);

    if (ssAlt in Shift)  and  (Key=83) then
   showmessage(DM.D08.filter);
end;


procedure TFrm_main.BitBtn3Click(Sender: TObject);
var
 rkey08: integer;
begin
  rkey08:=0;
  if not dm.D08.IsEmpty then  rkey08:=dm.D08rkey.Value;
  dm.D08.Close;
  dm.D08.Prepared;
  dm.D08.Open;
  dm.D08.Locate('rkey',rkey08,[]);
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dbgrid1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dbgrid1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
    begin
     dbgrid1.DataSource.DataSet.Filter:='';

    end;
     rg1.ItemIndex:=-1;
     DM.D08.Filtered:=true;
  Label1.Caption := '当前显示数目：' + IntToStr(DM.D08.RecordCount);
 end;
end;

procedure TFrm_main.dbgrid1TitleClick(Column: TColumnEh);
begin
  if dbgrid1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.D08.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.D08.Sort:=Column.FieldName+' DESC';
  end;

  if dbgrid1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label2.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then
  with TFrm_QrySet.Create(Application) do
  begin
    if ShowModal=mrok then
    begin
      for i:=1 to sgrid1.RowCount-2 do
        if sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+sgrid1.Cells[2,i];
      FsSearch:=' where 1=1 '+Sqlstr;
      DM.D08.SQL.Text:=sSQL+FsSearch+' order by A.prod_code ';
      dm.D08.Prepared;
      dm.D08.Open;
      DM.D08.Filtered:=False;
       rg1.ItemIndex:=-1;
      Label1.Caption := '当前显示数目：' + IntToStr(DM.D08.RecordCount);
    end;
  end;
end;

procedure TFrm_main.N1Click(Sender: TObject);
//var str:string;
begin

//  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
//  begin
//    messagedlg('对不起!您的权限不够，请联系管理员。',mtinformation,[mbok],0);
//    Exit;
//  end;

  with DM.Tmp do
  begin
    Close;
    SQL.Text := 'select CSI_PTR,PROC_PTR from wzcp0100 where CSI_PTR='+ QuotedStr(rkey73)+' and PROC_PTR='+ QuotedStr(dm.D08RKEY.AsString);
    Open;
  end;
//   ShowMessage(SQL.Text);
  if Tmenuitem(Sender).Tag in[1,2] then
  if (DM.D08if_control.Value=True) and (dm.Tmp.IsEmpty) then
  begin
    ShowMessage('该产品为管控项目，你没有权限操作该产品');
    Exit;
  end;
  

  case Tmenuitem(Sender).Tag of
    0,1,3,4:  //add,edit,look,copy
    try
      Frm_Edit:=TFrm_Edit.Create(nil);
      Frm_Edit.Ftag:=Tmenuitem(Sender).Tag;
      Frm_Edit.init;
      if Frm_Edit.ShowModal=mrok then
      begin
        dm.D08.Close;
        dm.D08.Prepared;
        dm.D08.Open;
        dm.D08.Locate('rkey',Frm_Edit.rkey08,[]);
      end;
    finally
      Frm_Edit.Free;
      DM.D08_1.Close;
      DM.wzcp01.Close;
    end;

    2: begin  //delete
         if MessageBox(Handle,'确定删除此产品编码吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;

         DM.Tmp.Close;
         DM.Tmp.SQL.Text:='select top 1 rkey from data0140 where part_ptr='+DM.D08RKEY.AsString ;
         DM.Tmp.Open;
         if not DM.Tmp.IsEmpty then
         begin
           showmessage('此产品已有做BOM,不能删除...');
           exit; 
         end;
         DM.Tmp.Close;
         DM.Tmp.SQL.Text:='select top 1 rkey from data0053 where cust_part_ptr='+DM.D08RKEY.AsString+
                          ' union all '+
                          'select top 1 rkey from wzcp0063 where prod_ptr='+DM.D08RKEY.AsString;
         DM.Tmp.Open;
         if not DM.Tmp.IsEmpty then
           showmessage('此产品已有进出记录,不能删除...')           
         else begin
           DM.Tmp.Close;
           DM.Tmp.SQL.Text:='delete from data0008 where rkey='+DM.D08RKEY.AsString;
           DM.Tmp.ExecSQL;
           DM.D08.Prior;
           BitBtn3Click(nil);
         end;
       end;
  end;
end;

procedure TFrm_main.BitBtn2Click(Sender: TObject);
begin
  if not DM.D08.IsEmpty then
    Export_dbGridEH_to_Excel(dbgrid1,'产品编码');
end;

procedure TFrm_main.BOM1Click(Sender: TObject);
begin
  with DM.Tmp do
  begin
    Close;
    SQL.Text := 'select CSI_PTR,PROC_PTR from wzcp0100 where CSI_PTR='+ QuotedStr(rkey73)+' and PROC_PTR='+ QuotedStr(dm.D08RKEY.AsString);
    Open;
  end;
//   ShowMessage(SQL.Text);
  if (DM.D08if_control.Value=True) and (dm.Tmp.IsEmpty) then
  begin
    ShowMessage('你没有权限查看该产品');
    Exit;
  end;
  Frm_BOM:=TFrm_BOM.Create(nil);
  try
    Frm_BOM.Label4.Caption:=DM.D08PROD_CODE.Value+'; 产品名称：'+DM.D08PRODUCT_NAME.Value;
    Frm_BOM.init;
    Frm_BOM.ShowModal;
  finally
    Frm_BOM.Free;

    DM.ADO140.Close;
    DM.ADO148.Close;
    DM.ADO140.Filter:='';
    DM.ADO148.Filter:='';
    //BitBtn3Click(nil); 
  end;
end;

procedure TFrm_main.N5Click(Sender: TObject);
begin
  Frm_order:=TFrm_order.Create(nil);
  try
    Frm_order.init(' where WZCP0071.prod_ptr='+DM.D08RKEY.AsString+' order by data0010.cust_code');
    Frm_order.ShowModal;
  finally
    Frm_order.Free;
  end;
end;

procedure TFrm_main.BitBtn4Click(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QryOrder=nil then
  begin
    Frm_QryOrder:=TFrm_QryOrder.Create(Application);
    Frm_QryOrder.DP1.Date:=date-15;
    Frm_QryOrder.DP2.Date:=date;
  end;
  if Frm_QryOrder.ShowModal=mrok then
  begin
    for i:=1 to Frm_QryOrder.sgrid1.RowCount-2 do
      if Frm_QryOrder.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QryOrder.sgrid1.Cells[2,i];
    Sqlstr:='where WZCP0070.sales_date>='''+datetostr(Frm_QryOrder.DP1.date)+''' and WZCP0070.sales_date-1<'''+datetostr(Frm_QryOrder.DP2.date)+''''+Sqlstr+' order by data0010.cust_code';
    Frm_order:=TFrm_order.Create(nil);
    try
      Frm_order.init(Sqlstr);
      Frm_order.ShowModal;
    finally
      Frm_order.Free;
    end;
  end;
end;

procedure TFrm_main.dbgrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if not DM.D08RKEY140.IsNull  then  dbgrid1.Canvas.Font.Color := clTeal;
  if dm.D08rkey0053.Value > 0  then  dbgrid1.Canvas.Font.Color := clmaroon ;  
  dbgrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_main.N6Click(Sender: TObject);
begin
//  FrmproInfo:= TFrmproInfo.Create(nil);
//  try
//    FrmproInfo.ShowModal;
//  finally
//    FrmproInfo.Free;
//  end;
end;

procedure TFrm_main.N7Click(Sender: TObject);
begin
  try
    with TfrmMatPrice.Create(nil) do
    begin
      Label4.Caption:=DM.D08PROD_CODE.Value+' '+DM.D08PRODUCT_NAME.Value;
      init;
      ShowModal;
    end;
  finally
    frmMatPrice.Free;
  end;
end;

procedure TFrm_main.N11Click(Sender: TObject);
begin
  try
         frm_fatherparts:=Tfrm_fatherparts.Create(nil);
         frm_fatherparts.init;
         if frm_fatherparts.ShowModal=mrok then
         begin
           dm.D08.Locate('rkey',Frm_Edit.rkey08,[]);
         end;
       finally
         frm_fatherparts.Free;
       end;
end;

procedure TFrm_main.N12Click(Sender: TObject);
begin
     try
         Frm_tree:=TFrm_tree.Create(nil);
         Frm_tree.init;

         if Frm_tree.ShowModal=mrok then
         begin
          // ShowMessage(Frm_tree.qry2.SQL.text);
           dm.D08.Locate('rkey',Frm_Edit.rkey08,[]);
         end;
       finally
         Frm_tree.Free;
       end;
end;

procedure TFrm_main.N15Click(Sender: TObject);
begin
    if (strtoint(vprev)=1)   then
    begin
     showmessage('对不起您只有该程序的只读权限!') ;
     exit;
    end;

  if DM.Tmp.Active then DM.Tmp.Active := False;
  DM.Tmp.SQL.Clear;
  DM.Tmp.SQL.Text := ' select  * from data0017 where INV_PART_NUMBER='+ quotedstr(DM.D08PROD_CODE.AsString);
  DM.Tmp.Open;
  if not DM.Tmp.IsEmpty then
    begin
      showmessage('材料编码已经在材料表里存在!') ;
      exit;
    end;

   Frm_New := TFrm_New.Create(nil);
   Frm_New.MaskEdit1.Text := DM.D08PROD_CODE.AsString;
   Frm_New.Edit5.Text  := DM.D08PRODUCT_NAME.AsString;
   Frm_New.Edit4.Text := dm.D08PRODUCT_DESC.AsString;

   Frm_New.Edit2.Text := DM.D08UNIT_CODE.AsString;
   Frm_New.Edit2.Tag := DM.D08unit_ptr.AsInteger;
   Frm_New.Label8.Caption := DM.D08UNIT_NAME.AsString;

   Frm_New.Edit3.Text := DM.D08UNIT_CODE.AsString;
   Frm_New.Edit3.tag := dm.D08unit_ptr.AsInteger;
   Frm_New.Label9.Caption := DM.D08UNIT_NAME.AsString;

   Frm_New.edit2.Font.Color := clwindowtext;
   Frm_New.edit3.Font.Color := clwindowtext;

   Frm_New.qrytemp.Open;
   if not Frm_New.qrytemp.IsEmpty then
   begin
    Frm_New.Edit1.Text := Frm_New.qrytemp.fieldbyname('GROUP_NAME').AsString;
    edit1.Font.Color := clwindowtext;
    Frm_New.label7.Caption := Frm_New.qrytemp.fieldbyname('GROUP_DESC').AsString;
    Frm_New.Edit1.tag := Frm_New.qrytemp.fieldbyname('rkey').AsInteger;
   end;
   if Frm_New.qrytemp.Active then Frm_New.qrytemp.Active := False;

   try
    if Frm_New.ShowModal = mrok then
     try
     finally
        ShowMessage('材料编码添加成功');
     end;
   finally
     Frm_New.free;

   end;

end;

procedure TFrm_main.N16Click(Sender: TObject);
begin
  frm_change := Tfrm_change.Create(Application);
  frm_change.ADS318.Close;
  frm_change.ADS318.Parameters[0].Value := DM.D08RKEY.Value;
  frm_change.ADS318.Open;
//  if frm_change.ADS318.IsEmpty then Exit;
  if frm_change.ShowModal=mrok then
end;

procedure TFrm_main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   // Frm_BOM.Show;
   Application.Terminate;
end;

procedure TFrm_main.mniBOM2Click(Sender: TObject);
var
 // Lfrm:TfrmBOMMtrl;
  Lsql:string;
begin

  frmBOMMtrl:=  TfrmBOMMtrl.Create(nil);
  frmBOMMtrl.ShowModal;
  try

  finally
    frmBOMMtrl.free;
  end;

end;

procedure TFrm_main.mni_MrtlsClick(Sender: TObject);
var
  Lfrm:TfrmAllMtrls;
  Lsql:string;
begin

  Lfrm:=  TfrmAllMtrls.Create(self);
  Lfrm.edt_PCode.Text:=dm.D08PROD_CODE.asstring;
  Lfrm.edt_PName.Text:=dm.D08PRODUCT_NAME.asstring;
  Lfrm.GetMtrls(DM.D08RKEY.asinteger);
  Lfrm.ShowModal;
  try

  finally
    Lfrm.free;
  end;

end;

procedure TFrm_main.rg1Click(Sender: TObject);
var
 str,str1,str2,str3,str4,Fstr:string;

begin
   //if dm.d08.isempty then exit;

  //DM.D08.Filtered:=false;
  
   str1:=' status140=0   ';
   str2:=' status140 =1 ';
   str3:=' status494=0  ';
   str4:=' status494=1';

  case rg1.ItemIndex of
  0:  str:=str1 ;
  1:  str:=str2;
  2:  str:=str3;
  3:  str:=str4 ;
  end;

  if DM.D08.Filter<>'' then
  begin
    Fstr:= DM.D08.Filter;
    if Pos(str1,Fstr)>0 then
    Fstr:=StringReplace(Fstr,str1,'',[rfReplaceAll]);

    if Pos(str2,Fstr)>0 then
    Fstr:=StringReplace(Fstr,str2,'',[rfReplaceAll]);

    if Pos(str3,Fstr)>0 then
    Fstr:=StringReplace(Fstr,str3,'',[rfReplaceAll]);

    if Pos(str4,Fstr)>0 then
    Fstr:=StringReplace(Fstr,str4,'',[rfReplaceAll]);
  end;

   Fstr:=StringReplace(Fstr,'and','',[rfReplaceAll]);

  if trim(Fstr)<>'' then
   DM.D08.Filter:=Fstr+' and '+str
  else
   DM.D08.Filter:=str;

   // showmessage(DM.D08.Filter);

 dm.D08.Filtered:=true;

end;

end.
