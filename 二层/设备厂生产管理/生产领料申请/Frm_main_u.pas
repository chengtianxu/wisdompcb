unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, daDataModule;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Panel3: TPanel;
    Grd1: TDBGridEh;
    Splitter1: TSplitter;
    Grd2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N_New: TMenuItem;
    N_Edit: TMenuItem;
    N_Check: TMenuItem;
    N12: TMenuItem;
    N_delete: TMenuItem;
    N_print: TMenuItem;
    BitBtn6: TBitBtn;
    N_Allocation: TMenuItem;
    N_CancelAllocation: TMenuItem;
    BitBtn1: TBitBtn;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N_NewClick(Sender: TObject);
    procedure N_printClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Grd2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N_AllocationClick(Sender: TObject);
    procedure N_CancelAllocationClick(Sender: TObject);
    procedure Grd2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    Qty, ValQty: Real;
    procedure init;
 //   procedure ColEnter(Sender: TObject);
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u,Frm_detail_u, URep, UVMIForm;
{$R *.dfm}

procedure TFrm_main.init;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;

  sSql:=DM.ADO268.SQL.Text;
  DM.ADO268.SQL.Text:=DM.ADO268.SQL.Text+' and data0268.date>getdate()-3 ';
  DM.ADO268.Open;
  DM.ADO268.Sort:=PreColumn.FieldName;
end;

procedure TFrm_main.FormCreate(Sender: TObject);
begin  {  }
  if not App_Init_2(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;

//   dm.ADOCon.Open;
//  user_ptr := '430'; //161
//  rkey73:='190';
//  vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;

end;

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  Frm_QrySet.Free;
  close;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if DM.ADO268.IsEmpty then exit;
  i := DM.ADO268rkey.AsInteger ;
  DM.ADO268.Close;
  DM.ADO268.Open;
  DM.ADO268.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO268.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO268.Sort:=Column.FieldName+' DESC';
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
  end else
    edit1.SetFocus;
end;


procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO268status.Value = 0 then
     Grd1.Canvas.Font.Color := clWindowText
  else if dm.ADO268status.Value = 2 then
     Grd1.Canvas.Font.Color := clTeal //cllime
  else if dm.ADO268status.Value = 1 then
     Grd1.Canvas.Font.Color := clfuchsia
  else if dm.ADO268status.Value = 4 then
     Grd1.Canvas.Font.Color := clGreen;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
var
  isctrl:Boolean; //受控为true 不受控自有访问为false
begin
  isctrl:= DM.ADO268.FieldByName('if_control').AsInteger=1;
  N_New.Enabled:=(vprev='2') or (vprev='4');
  if DM.ADO268.IsEmpty then
  begin
    N_Edit.Enabled:=false;    //编辑
    N_Check.Enabled:=false;    //检查
    N_delete.Enabled:=false;    //删除
    N_print.Enabled:=false;    //prt
//    N1.Enabled:=False;
  end
  else
  begin
    N_Edit.Enabled:=N_New.Enabled and (dm.ADO268status.AsInteger in[2,3]) and (Dm.ADO268EMPL_PTR.AsString=user_ptr) and (Dm.ADO268Prted.AsBoolean=False) ;
    N_Check.Enabled := not isctrl;             //彭华修改于2012-08-23，2已审核;3被退回 可以修改
    N_delete.Enabled:=N_New.Enabled and (dm.ADO268status.AsInteger in[2]) and (Dm.ADO268EMPL_PTR.AsString=user_ptr) and (not isctrl);
    N_print.Enabled := (dm.ADO268status.AsInteger in [2,4]) and ((vprev='3') or not DM.ADO268Prted.AsBoolean) and (not isctrl);  //申请人员只能打印一次,仓库人员可多次打印
//    N1.Enabled:=N_New.Enabled and (dm.ADO268status.AsInteger in[0])
  end;
  if Dm.ADO268EMPL_PTR.AsString=user_ptr then
  begin
   if DM.ADO468quan_alloc.Value > 0 then
     begin
       N_Allocation.Enabled := False and (not isctrl);
       N_CancelAllocation.Enabled := True and ( not isctrl);
     end
   else
     begin
       N_CancelAllocation.Enabled := False and (not isctrl);
       N_Allocation.Enabled := True and (not isctrl);
     end;
  end
  else
  begin
       N_CancelAllocation.Enabled := False and (not isctrl);
       N_Allocation.Enabled := False and (not isctrl);
  end;
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    DM.ADO268.SQL.Text:=sSql+' and data0268.date>='''+formatdatetime('YYYY-MM-DD',Frm_QrySet.DateTimePicker1.Date)+
                           ''' and data0268.date-1<='''+
                           formatdatetime('YYYY-MM-DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr;
    DM.ADO268.Close;
    DM.ADO268.Open;
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO268.SQL.Text);
end;

procedure TFrm_main.N_NewClick(Sender: TObject);
var sl:Double;
begin
  if (Tmenuitem(Sender).Tag in [0,1,3,4]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

  case Tmenuitem(Sender).Tag of
  0,1,2: with TFrm_detail.Create(nil) do
       try
         Ftag:=Tmenuitem(Sender).Tag;
         FGrd:=Grd2;
         initd;
         if showmodal=mrok then
         begin
           DM.ADO268.Close;
           DM.ADO268.Open;
           DM.ADO268.Locate('rkey',Frkey268,[]);
         end;
       finally
         free;
         DM.ADO268_1.Close;
         DM.ADO268_1.Close;
       end;

   4: begin
        if MessageBox(Handle,'确定删除此申请单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.ADOCon.BeginTrans;
        try
          DM.tmp.Close;
          DM.tmp.SQL.Text:='delete from data0468  where flow_no='+DM.ADO268rkey.AsString+' and quan_issued=0';
          if DM.tmp.ExecSQL<>DM.ADO468.RecordCount then
          begin
            DM.ADOCon.RollbackTrans;
            showmessage('删除数据失败,已有物料发放...');
          end else begin
            DM.tmp.SQL.Text:='delete from data0268 where rkey='+DM.ADO268Rkey.AsString+' and status<>4' ;
            if DM.tmp.ExecSQL=0 then
            begin
              DM.ADOCon.RollbackTrans;
              showmessage('删除数据失败,数据状态已发生变化...');
            end;
//20150513添加删除268，468同时退回wzcp0492申领数量-----------------
//            if DM.ADO268status.AsInteger=2 then
//            begin
              DM.ADO468.First;
              sl:=0;
              while not dm.ADO468.Eof do
              begin
                dm.tmp1.Close;
                dm.tmp1.SQL.Clear;
                DM.tmp1.SQL.Text:='select * from wzcp0492 where rkey='+dm.ADO468wzcp0492_ptr.AsString;
                dm.tmp1.Open;
                if not dm.tmp1.IsEmpty then
                begin
                  sl:=DM.tmp1.FieldByName('App_QTY').AsFloat;
                  sl:=sl-dm.ADO468QUAN_BOM.AsFloat;
                  dm.tmp2.Close;
                  dm.tmp2.SQL.Clear;
                  DM.tmp2.SQL.Text:='update wzcp0492 set App_QTY='+floattostr(sl)+' where rkey='+dm.ADO468wzcp0492_ptr.AsString;
                  dm.tmp2.ExecSQL;
                end;
                dm.ADO468.Next;
              end;
//            end;
//end 20150513添加删除
            DM.ADOCon.CommitTrans;
          end;
          BtBrushClick(nil);
       except
         DM.ADOCon.RollbackTrans;
         showmessage('删除数据失败...');
       end;
      end;
  end;
end;

procedure TFrm_main.N_printClick(Sender: TObject);
begin
  BtBrushClick(nil);
  if DM.ADO268Prted.AsBoolean and (vprev<>'3') then
  begin
    showmessage('此申请单已经打印,您无权重复打印...');
    exit;
  end;
        try
                Report_Frm:= TReport_Frm.Create(application);
                Report_Frm.ADS268.Close;
                Report_Frm.ADS268.Parameters[0].Value:=DM.ADO268rkey.Value;
                Report_Frm.ADS268.Open;
                Report_Frm.ADS468.Close;
                Report_Frm.ADS468.Parameters[0].Value:=DM.ADO268rkey.Value;
                Report_Frm.ADS468.Open;
                Report_Frm.ppReport1.Reset;
                Report_Frm.ppReport1.Template.FileName :=
                  stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+'\Rep268.rtm';
                Report_Frm.ppReport1.Template.LoadFromFile;

                Report_Frm.ppReport1.SaveAsTemplate:=false;
                Report_Frm.ppReport1.Print;
        finally
                Report_Frm.ADS468.Close;
                Report_Frm.ADS268.Close;
                Report_Frm.Free;
        end;
  BtBrushClick(nil);
end;

procedure TFrm_main.BitBtn6Click(Sender: TObject);
begin
 { if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;
        ppReport1.Reset;
        ppReport1.Template.FileName :=
        stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'Rep268.rtm';
        ppReport1.Template.LoadFromFile;
        ppReport1.SaveAsTemplate:=true;
        ppdesigner1.ShowModal; }
end;


procedure TFrm_main.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_main.Grd2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO468.SQL.Text);
end;


procedure TFrm_main.N_AllocationClick(Sender: TObject);
var
  part_name: string;
  i, Rkey0022: Integer;
  Date: TDateTime;
begin
  if vprev<>'4' then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

  DM.ADO468.First;
  for i := 0 to DM.ADO468.RecordCount - 1 do
  begin
    Qty:=DM.ADO468.FieldByName('QUAN_BOM').AsFloat - DM.ADO468.FieldByName('QUAN_ISSUED').AsFloat;
    if Qty <= 0 then
    begin
      part_name := DM.ADO468.FieldByName('INV_PART_NUMBER').AsString;
      ShowMessage('物料 '+part_name+ ' 已发料完毕！');
      DM.ADO468.Next;
      continue;
    end;
    with DM.tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select rkey,  (QUAN_on_hand - QUAN_TO_BE_STOCKED) as ValQty,  convert(varchar(100),getdate(),23) date from  data0022 '
        + 'where  (dbo.Data0022.QUAN_on_hand - dbo.Data0022.QUAN_TO_BE_STOCKED > 0) and INVENTORY_PTR = '+ IntToStr(DM.ADO468rkey17.Value);
      Open;
      if RecordCount <= 0 then
      begin
        ShowMessage('物料 ' + DM.ADO468.FieldByName('INV_PART_NUMBER').AsString + ' 库存不足，请检查！');
        DM.ADO468.Next;
        continue;
      end;
      Date := fieldByname('date').AsDateTime;
      Rkey0022 := fieldByname('rkey').AsInteger;
      ValQty := FieldValues['ValQty'];   //该物料可分配总数 (当前库存总数 - 已分配数量)
    end;

    if ValQty > Qty then   //如果  该物料可分配总数 > 本次需求数量
    begin
      with DM.tmp do
      begin
        // data0022表 已分配数量 = 已分配数量 +  本次需求数量
        Close;
        SQL.Clear;
        SQL.Text := 'update data0022 set QUAN_TO_BE_STOCKED=QUAN_TO_BE_STOCKED + ' + FloatToStr(Qty)
          + ' where (dbo.Data0022.QUAN_on_hand - dbo.Data0022.QUAN_TO_BE_STOCKED > 0) and INVENTORY_PTR = '+ IntToStr(DM.ADO468rkey17.Value);
        ExecSQL;

        //插入475表
        Close;
        SQL.Clear;
        DM.tmp.SQL.Text:='insert into data0475 values('+DM.ADO468rkey.AsString+','+inttostr(Rkey0022)+','+FloatToStr(Qty)
              +','+ user_ptr +','+ QuotedStr(DateToStr(Date))+')';
        ExecSQL;

        //更新17表的已分配库存
        Close;
        SQL.Clear;
        SQL.Text:='update data0017 set QUAN_assign= QUAN_assign+'+floattostr(Qty)+' where rkey='+DM.ADO468rkey17.AsString;
        ExecSQL;

        //更新468表quan_alloc字段
        Close;
        SQL.Clear;
        SQL.Text:='update data0468 set quan_alloc='+floattostr(Qty)+' where rkey='+DM.ADO468rkey.AsString;
        ExecSQL;
      end;
    end;
    if ValQty <= Qty then  //如果  该物料可分配数 <= 本次需求数量
    begin
      with DM.tmp do
      begin
        //data0022表 已分配数量 = 库存总数
        Close;
        SQL.Clear;
        SQL.Text := 'update data0022 set QUAN_TO_BE_STOCKED=QUAN_ON_HAND '
          + 'where (dbo.Data0022.QUAN_on_hand - dbo.Data0022.QUAN_TO_BE_STOCKED > 0) and INVENTORY_PTR = '+ IntToStr(DM.ADO468rkey17.Value);
        ExecSQL;

        //插入475表
        Close;
        SQL.Clear;
        DM.tmp.SQL.Text:='insert into data0475 values('+DM.ADO468rkey.AsString+','+inttostr(Rkey0022)+','+FloatToStr(ValQty)
              +','+ user_ptr +','+ QuotedStr(DateToStr(Date))+')';
        ExecSQL;

        //更新17表的已分配库存
        Close;
        SQL.Clear;
        SQL.Text:='update data0017 set QUAN_assign= QUAN_assign+'+FloatToStr(ValQty)+' where rkey='+DM.ADO468rkey17.AsString;
        ExecSQL;

        //更新468表quan_alloc字段
        Close;
        SQL.Clear;
        SQL.Text:='update data0468 set quan_alloc='+FloatToStr(ValQty)+' where rkey='+DM.ADO468rkey.AsString;
        ExecSQL;
      end;
    end;
    DM.ADO468.Next;
  end;
  ShowMessage('本次分配已完成!');
end;

procedure TFrm_main.N_CancelAllocationClick(Sender: TObject);
var
  i: Integer;
begin
  if vprev<>'4' then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  try
    if MessageBox(Handle,'确定取消此材料分配吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
    DM.ADO468.First;
    for i := 0 to DM.ADO468.RecordCount - 1 do
    begin
      with DM.tmp do
      begin
        //更新22表 已分配数 - 本次申请数（475表quan_alloc）
        Close;
        SQL.Clear;
        SQL.Text := 'update data0022 set QUAN_TO_BE_STOCKED=QUAN_TO_BE_STOCKED-B.quan_alloc '
          +'from data0022 A inner join data0475 B on A.RKEY = B.rkey22 where B.rkey468='+DM.ADO468rkey.AsString;
        ExecSQL;

        //删除475表
        Close;
        SQL.Clear;
        SQL.Text := 'delete from data0475  where rkey468='+DM.ADO468rkey.AsString;
        ExecSQL;

        //更新468表
        DM.ADO468.Edit;
        DM.ADO468quan_alloc.Value:=0;
        DM.ADO468.Post;

        //更新17表
        Close;
        SQL.Clear;
        SQL.Text:='update data0017 set QUAN_assign= QUAN_assign-'+floattostr(DM.ADO468.FieldValues['quan_bom'])+' where rkey='+DM.ADO468rkey17.AsString;
        ExecSQL;
      end;
      DM.ADO468.Next;
    end;
  except
    on E: Exception do
    begin
      ShowMessage(e.message);
    end;
  end;
end;


procedure TFrm_main.Grd2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO468quan_alloc.Value <> 0 then
     Grd2.Canvas.Font.Color := clred ;
  Grd2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
  with TVMIForm.Create(nil) do
  try
    ShowModal;
  finally
    free;
  end;
end;

procedure TFrm_main.N1Click(Sender: TObject);
var i:Integer;
begin
  dm.tmp1.Close;
  dm.tmp1.SQL.Clear;
  DM.tmp1.SQL.Text:='update dbo.DATA0268 set status=2 where number='''+dm.ADO268number.AsString+'''';
  dm.tmp1.ExecSQL;
  BtBrushClick(nil);
end;

end.
