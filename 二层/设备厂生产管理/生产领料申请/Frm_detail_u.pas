unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB, DM_u, common, Pick_Item_Single, ConstVar,
  Frm_detailEdt_u, PasWzcp0492;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    Panel2: TPanel;
    SGrid: TStringGrid;
    N2: TMenuItem;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit5: TEdit;
    Label10: TLabel;
    BtnSave: TBitBtn;
    EdtDept: TEdit;
    SpeedButton1: TSpeedButton;
    MaskEdit1: TMaskEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    CBFac: TComboBox;
    Label2: TLabel;
    EdtCut_no: TEdit;
    Label9: TLabel;
    Label11: TLabel;
    Edit1: TEdit;
    Label12: TLabel;
    Edit2: TEdit;
    Label13: TLabel;
    SpeedButton2: TSpeedButton;
    btnBranch: TBitBtn;
    procedure BitBtn9Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure CBFacChange(Sender: TObject);
    procedure SGridKeyPress(Sender: TObject; var Key: Char);
    procedure SGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnBranchClick(Sender: TObject);
  private
    dSLold,dSLEdit:Double;
    iRowNo:Integer;
    Ffac:array[0..10] of integer;
    function getRkey(AdoConn: TADOConnection; const strSQL:string):Integer; //
  public

    FGrd:TDBGridEh;
    procedure initd;
  end;

implementation


{$R *.dfm}

function TFrm_detail.getRkey(AdoConn: TADOConnection; const strSQL:string):Integer; //
var tmpAdo: TADOQuery;
begin
  try
    tmpAdo := TAdoQuery.Create(nil);
    tmpAdo.Connection := AdoConn;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Text:=strSQL;
    tmpAdo.Open;
    tmpAdo.First;
    if tmpAdo.RecordCount > 0 then
      Result := tmpAdo.FieldByName('Rkey').Value
    else
      Result := 0;
  except
    tmpAdo.Close;
    tmpAdo.Connection := nil;
    tmpAdo.Free;
    tmpAdo := nil;
    Result := 0;
  end;
end;

procedure TFrm_detail.initd;
var i,j:integer;
    stmpSQL:string;
begin
  for i:=0 to 6 do
  begin
    SGrid.Cells[i,0]:=FGrd.Columns[i].Title.Caption;
    SGrid.ColWidths[i]:=FGrd.Columns[i].Width;
  end;

  SGrid.Cells[7,0]:='rkey17';
  SGrid.Cells[8,0]:='invent_or';
  SGrid.Cells[9,0]:='Rkeyd492';
  SGrid.Cells[10,0]:='标准数量';
  SGrid.Cells[11,0]:='已申领数量';
  SGrid.Cells[12,0]:='申领数量2';
  SGrid.Cells[13,0]:='已发放数';
  SGrid.Cells[14,0]:='Rkey495';
  SGrid.Cells[15,0]:='BOM名称';
  SGrid.Cells[16,0]:='当前库存';
  SGrid.Cells[17,0]:='主料17.Rkey';
  SGrid.ColWidths[7]:=-1;
  SGrid.ColWidths[8]:=-1;
  SGrid.ColWidths[9]:=-1;
  SGrid.ColWidths[10]:=55;
  SGrid.ColWidths[11]:=65;
  SGrid.ColWidths[12]:=-1;
  SGrid.ColWidths[13]:=55;
  SGrid.ColWidths[14]:=-1;
  SGrid.ColWidths[15]:=75;
  SGrid.ColWidths[16]:=55;
  SGrid.ColWidths[17]:=-1;
  SGrid.ColWidths[18]:=-1;

  DM.tmp.Close;
  DM.tmp.SQL.Text:='select rkey,abbr_name from data0015 WHERE active_flag=''Y''';
  DM.tmp.Open;
  i:=0;

  while not DM.tmp.Eof do
  begin
    Ffac[i]:=DM.tmp.Fields[0].AsInteger;
    CBFac.Items.Append(DM.tmp.Fields[1].asstring);
    DM.tmp.Next;
    inc(i);
  end;
  if DM.tmp.RecordCount=1 then
  begin
    CBFac.ItemIndex:=0;
    CBFac.Tag:=DM.tmp.Fields[0].AsInteger;
  end;
  if Ftag=0 then
  begin
    self.Caption:='材料申领-新增';
    DM.GetNo(MaskEdit1,'36',0);
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select getdate()';
    DM.tmp.Open;
    DateTimePicker1.DateTime:=DM.tmp.Fields[0].AsDateTime;

    DM.ADO268_1.Close;
    DM.ADO268_1.Parameters[0].Value:=-1;
    DM.ADO268_1.Open;
    DM.ADO468_1.Close;
    DM.ADO468_1.Parameters[0].Value:=-1;
    DM.ADO468_1.Open;
  end else begin
    if Ftag=1 then
    begin
      self.Caption:='材料申领-修改';
      N2.Visible:=False;
    end else if Ftag=2 then begin
      self.Caption:='材料申领-查看';
      BtnSave.Enabled:=false;
      SpeedButton1.Enabled:=false;
    end;


    MaskEdit1.ReadOnly:=true;
    DM.ADO468.Close;
    DM.ADO468.Open;
    if Ftag<>10 then
    begin
      DM.ADO268_1.Close;
      DM.ADO268_1.Parameters[0].Value:=DM.ADO268rkey.Value;
      DM.ADO268_1.Open;

      DM.ADO468_1.Close;
      DM.ADO468_1.Parameters[0].Value:=DM.ADO268rkey.Value;
      DM.ADO468_1.Open;
      MaskEdit1.Text:=DM.ADO268.Fieldbyname('number').AsString;
      DateTimePicker1.DateTime:=DM.ADO268.Fieldbyname('date').AsDateTime;
    end;

    EdtCut_no.Text:=DM.ADO268.FieldByName('cut_no').AsString;
//    EdtCut_no.tag:=DM.ADO268.FieldByName('bom_ptr').AsInteger;
//20150513EdtCut_no.tag取值修改为data0492Rkey
    stmpSQL:='SELECT dbo.data0492.rkey FROM  dbo.data0492 INNER JOIN'
             +' dbo.DATA0268 ON dbo.data0492.CUT_NO = dbo.DATA0268.CUT_NO'
             +' where dbo.data0492.CUT_NO='''+DM.ADO268.FieldByName('cut_no').AsString+''' and dbo.DATA0268.number='''+DM.ADO268.Fieldbyname('number').AsString+'''';
    EdtCut_no.tag:=getRkey(DM.ADOCon,stmpSQL);
//----------------------------------------------
    label9.Caption:=DM.ADO268.FieldByName('PROD_CODE').AsString+' '+DM.ADO268.FieldByName('PRODUCT_NAME').AsString;
    Edit1.Text:=DM.ADO268.FieldByName('ISSUED_QTY').AsString;

    Edit5.Text:=DM.ADO268.Fieldbyname('reference').AsString;
    EdtDept.Text:=DM.ADO268.Fieldbyname('dept_code').AsString;
    label6.Caption:=DM.ADO268.Fieldbyname('Dept_name').AsString;
    EdtDept.Tag:=DM.ADO268.Fieldbyname('Dept_ptr').AsInteger;
    CBFac.Tag:=DM.ADO268.Fieldbyname('warehouse_ptr').AsInteger;
    SpeedButton1.Enabled:=false;
    if (DM.ado268.FieldByName('user_name').AsString<>'') then
    begin
      DM.tmp.Close;
      dm.tmp.SQL.Clear;
      dm.tmp.SQL.Text:='select * from data0005 where Rkey='+DM.ado268.FieldByName('user_name').AsString;
      dm.tmp.Open;
      if (not dm.tmp.IsEmpty) then
      begin
        Edit2.Text:=dm.tmp.FieldByName('EMPL_CODE').AsString;
        Label13.Caption:=dm.tmp.FieldByName('EMPLOYEE_NAME').AsString;
        Edit2.Tag:=DM.ado268.FieldByName('user_name').AsInteger;
      end;
    end;
    
    for i:=0 to 4 do
      if CBFac.Tag=Ffac[i] then begin CBFac.ItemIndex:=i;break;end;
    j:=1;
    DM.ADO468.First;
    while not DM.ADO468.Eof do
    begin
      for i:=0 to 6 do
         SGrid.Cells[i,j]:=FGrd.Columns[i].Field.AsString;
      SGrid.Cells[12,j]:=FGrd.Columns[3].Field.AsString;//申领数量（比较使用）
      SGrid.Cells[7,j]:=DM.ADO468.fieldbyname('INVENT_PTR').AsString; //rkey17或rkey08;
      SGrid.Cells[8,j]:=DM.ADO468.fieldbyname('INVENT_or').AsString;  //INVENT_or;
      SGrid.Cells[9,j]:=IntToStr(EdtCut_no.tag); //data0492.Rkey;
      SGrid.Cells[14,j]:=DM.ADO468.fieldbyname('wzcp495Rkey').AsString;//wzcp495Rkey
      SGrid.Cells[15,j]:=DM.ADO468.fieldbyname('part_name').AsString;  //BOM名称;
      SGrid.Cells[16,j]:=DM.ADO468.FieldByName('QUAN_ON_HAND').AsString;// 当前库存
      SGrid.Cells[17,j]:=DM.ADO468.fieldbyname('INVENT_PTR').AsString;
      SGrid.Cells[18,j]:=DM.ADO468.fieldbyname('wzcp0492_ptr').AsString;//wzcp0492.rkey
      dm.tmp.Close;
      dm.tmp.SQL.Clear;
      dm.tmp.SQL.Text:='select Rkey,D492_ptr,D017_ptr,isnull(STD_QTY,0) STD_QTY,isnull(App_QTY,0) App_QTY,'
      +'isnull(Con_QTY,0) Con_QTY,isnull(QUAN_ASSIGN,0) QUAN_ASSIGN,D148_PTR,wzcp0495_ptr from wzcp0492 '
      +'where rkey='+Trim(sGrid.Cells[18,j]);
      DM.tmp.Open;
      if (DM.tmp.RecordCount=0) then
      begin
        SGrid.Cells[10,j]:='0';
        SGrid.Cells[11,j]:='0';
        SGrid.Cells[13,j]:='0';
      end else
      begin
        SGrid.Cells[10,j]:=FloatToStr(DM.tmp.fieldbyname('STD_QTY').Value);
        SGrid.Cells[11,j]:=FloatToStr(DM.tmp.fieldbyname('App_QTY').Value);
        SGrid.Cells[13,j]:=FloatToStr(DM.tmp.fieldbyname('Con_QTY').Value);
      end;
      SGrid.RowCount:=SGrid.RowCount+1;
      inc(j);
      DM.ADO468.Next;
    end;
  end;
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
var i,j:integer;
IR495:string;
begin
 SGrid.Enabled:=False;
 SGrid.Enabled:=True;
  if SGrid.RowCount=2 then
  begin
    showmessage('不能保存空记录...');
    exit;
  end;

  if MaskEdit1.Text='' then
  begin
    showmessage('申请单号不能为空...');
    exit;
  end;
  if EdtDept.Text='' then
  begin
    showmessage('申请部门不能为空...');
    exit;
  end;

  if CBFac.Text='' then
  begin
    showmessage('工厂不能为空...');
    exit;
  end;

  if DM.ADO468_1.IsEmpty then
  begin
    showmessage('明细记录不能为空...');
    exit;
  end;

//--20150513保存之前检查是否存在相同材料编号
  for i:=1 to SGrid.RowCount-3 do
  begin
    for j :=1+i to SGrid.RowCount-2 do
    begin
      if (SGrid.Cells[7,i]=SGrid.Cells[7,j]) then
      begin
        showmessage('存在同一款材料，请查证...');
        exit;
      end;
    end;
  end;

//-----------------------------------------
//--保存之前检测是否存在多人操作相同单号-----
  if Ftag=0  then
  begin
    for i:=1 to SGrid.RowCount-2 do
    begin
      DM.tmp1.Close;
      DM.tmp1.SQL.Clear;
      //IR495
//      if  (Trim(sGrid.Cells[18,i])='') and (Trim(sGrid.Cells[14,i])<>'') then
//      IR495:=Trim(sGrid.Cells[14,i])
//      else if (Trim(sGrid.Cells[18,i])<>'') and (Trim(sGrid.Cells[14,i])='') then
//      IR495:= (Trim(sGrid.Cells[18,i]);
      DM.tmp1.SQL.Text:='select (STD_QTY-App_QTY) as sl from wzcp0492 where d492_ptr='+SGrid.Cells[9,i]+'  and wzcp0495_ptr='+Trim(SGrid.Cells[14,i]);
     // ShowMessage(dm.tmp1.SQL.Text);
      dm.tmp1.Open;
      if (not DM.tmp1.IsEmpty) then
      begin
       if (DM.tmp1.FieldByName('sl').Value=0) then
       begin
        showmessage('材料编号【'+sGrid.Cells[0,i]+'】申领失败，可能多用户同时操作...');
        Exit;
       end;
      end;
    end;
//    DM.tmp.Close;
//    dm.tmp.SQL.Clear;
//    dm.tmp.SQL.Text:='select * from dbo.data0268 where CUT_NO='''+Trim(EdtCut_no.Text)+''' and status=0';
//    dm.tmp.Open;
//    if (not dm.tmp.IsEmpty) then
//    begin
//      showmessage('该生产单号存在待提交状态，请先提交再申领..');
//      abort;
//    end;
    DM.tmp.Close;
    dm.tmp.SQL.Clear;
    dm.tmp.SQL.Text:='select * from dbo.data0268 where number='''+Trim(MaskEdit1.Text)+'''';

    dm.tmp.Open;
    if (not dm.tmp.IsEmpty) then
    begin
      if messagedlg('申领单号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
       [mbYes,mbNo],0)=mrYes  then
       begin
         DM.GetNo(MaskEdit1,'36',0);
       end;
    end;
  end;
//end---
  if Ftag=0 then DM.ADO268_1.Append else DM.ADO268_1.Edit;
  DM.ADO268_1.FieldByName('cut_no').AsString:=EdtCut_no.Text;
  DM.ADO268_1.FieldByName('EMPL_PTR').AsString:=user_ptr;
  DM.ADO268_1.FieldByName('DATE').AsDateTime:=DateTimePicker1.DateTime;
  DM.ADO268_1.FieldByName('dept_ptr').AsInteger:=EdtDept.Tag;
  DM.ADO268_1.FieldByName('status').AsInteger:=2; //2待提交
  DM.ADO268_1.FieldByName('ttype').AsInteger:=1;
  DM.ADO268_1.FieldByName('Reference').AsString:=Edit5.Text;
  DM.ADO268_1.FieldByName('warehouse_ptr').AsInteger:=CBFac.Tag;
 { DM.ADO268_1.FieldByName('auth_emplptr').AsInteger:= dm.ADO268EMPL_PTR.AsInteger;
  DM.ADO268_1.FieldByName('auth_date').Value:= dm.ADO268DATE.Value;
  auth_emplptr	审核人员
  auth_date	审核日期(长格式)
  彭华20120803注释掉，用下面部分替换，原因是，dm.ADO268EMPL_PTR、dm.ADO268DATE这两个字段无法返回正确的字段值,有可能表是空值                }
  //////////////////////////
  DM.ADO268_1.FieldByName('auth_date').Value:= getsystem_date(DM.qryGetsystem_date,0) ;
  DM.ADO268_1.FieldByName('auth_emplptr').AsInteger:=StrToInt(user_ptr);
  if (Trim(Edit2.Text)<>'') then
  dm.ADO268_1.FieldByName('user_name').AsString:=IntToStr(Edit2.Tag);
  //////////////////////////

  DM.ADOCon.BeginTrans;
  try
    if ((Ftag=0) or (Ftag=10)) and not DM.GetNo(MaskEdit1,'36',1) then  abort;
    DM.ADO268_1.FieldByName('NUMBER').AsString:=MaskEdit1.Text;
    DM.ADO268_1.Post;
    DM.ADO268_1.UpdateBatch(arAll);
    for i:=1 to SGrid.RowCount-2 do
      if DM.ADO468_1.Locate('INVENT_PTR',strtoint(sGrid.Cells[7,i]),[]) then
      begin
        DM.ADO468_1.Edit;
        DM.ADO468_1.FieldByName('flow_no').AsInteger:=DM.ADO268_1.FieldByName('rkey').AsInteger;
        DM.ADO468_1.FieldByName('vendor').AsString:=SGrid.Cells[4,i];  //备注
        DM.ADO468_1.FieldByName('quan_bom').AsFloat:=StrToFloat(SGrid.Cells[3,i]);//申领数量
        DM.ADO468_1.Post;
        end else begin
        DM.ADOCon.RollbackTrans;
        showmessage('错误...');
        abort;
      end;
    DM.ADO468_1.UpdateBatch(arAll);

    DM.ADOCon.CommitTrans;
    Frkey268:=DM.ADO268_1.FieldByName('rkey').asinteger;
  //20150513添加修改wzcp0492的申领数量条件为对应材料17与生产单号
    if (Ftag=1) then //编辑
    begin
 //20160808修改允许替料
      for i:=1 to SGrid.RowCount-2 do
      begin
          dm.tmp1.Close;
          dm.tmp1.SQL.Clear;
          DM.tmp1.SQL.Text:='select * from wzcp0492 where d492_ptr='+SGrid.Cells[9,i]+'  and wzcp0495_ptr='+Trim(sGrid.Cells[14,i]);
          dm.tmp1.Open;
          if not dm.tmp1.IsEmpty then
          begin
            DM.tmp.Close;
            dm.tmp.SQL.Clear;
            DM.tmp.SQL.Text:='update wzcp0492 set App_QTY='+floattostr(dm.tmp1.FieldBYName('App_QTY').AsFloat-strtofloat(SGrid.Cells[11,i])+strTofloat(SGrid.Cells[3,i]))
  //          DM.tmp.SQL.Text:='update wzcp0492 set App_QTY='+floattostr(dm.tmp1.FieldBYName('App_QTY').AsFloat-dm.ADO468QUAN_BOM.AsFloat+strTofloat(SGrid.Cells[3,i]))
  ////          DM.tmp.SQL.Text:='update wzcp0492 set App_QTY='+floattostr(dm.tmp1.FieldBYName('App_QTY').AsFloat-strTofloat(SGrid.Cells[3,i]))
  //          DM.tmp.SQL.Text:='update wzcp0492 set App_QTY='+floattostr(strTofloat(SGrid.Cells[3,i]))
            +' where d492_ptr='+SGrid.Cells[9,i]+'   and wzcp0495_ptr='+Trim(sGrid.Cells[14,i]);
            DM.tmp.ExecSQL;
          end;
      end;
//      DM.ADO468.First;//退回编辑显示的468明细对应WZCP0492的申领数量
//      while not dm.ADO468.Eof do
//      begin
//        dm.tmp1.Close;
//        dm.tmp1.SQL.Clear;
//        DM.tmp1.SQL.Text:='select * from wzcp0492 where D017_ptr='+Trim(DM.ADO468rkey17.AsString)+' and D492_ptr='+Trim(DM.ADO268Rkey492.AsString)+' and D148_PTR='+Trim(dm.ADO468bom_list_ptr.AsString);
//        dm.tmp1.Open;
//        if not dm.tmp1.IsEmpty then
//        begin
//          DM.tmp.Close;
//          dm.tmp.SQL.Clear;
//          DM.tmp.SQL.Text:='update wzcp0492 set App_QTY='+floattostr(dm.tmp1.FieldBYName('App_QTY').AsFloat-dm.ADO468QUAN_BOM.AsFloat)
//          +' where D017_ptr='+Trim(DM.ADO468rkey17.AsString)+' and D492_ptr='+Trim(DM.ADO268Rkey492.AsString)+' and D148_PTR='+Trim(dm.ADO468bom_list_ptr.AsString);
//          DM.tmp.ExecSQL;
//        end;
//        dm.ADO468.Next;
//      end;
    end else
    //增加486_1对应WZCP0492的申领数量
    for i:=1 to SGrid.RowCount-2 do
    begin
      dm.tmp1.Close;
      dm.tmp1.SQL.Clear;
      DM.tmp1.SQL.Text:='select * from wzcp0492 where d492_ptr='+SGrid.Cells[9,i]+'  and wzcp0495_ptr='+Trim(sGrid.Cells[14,i]);
      dm.tmp1.Open;
      if not dm.tmp1.IsEmpty then
      begin
        DM.tmp.Close;
        dm.tmp.SQL.Clear;
        DM.tmp.SQL.Text:='update wzcp0492 set App_QTY='+floattostr(dm.tmp1.FieldBYName('App_QTY').AsFloat+strTofloat(SGrid.Cells[3,i]))
        +' where d492_ptr='+SGrid.Cells[9,i]+'  and wzcp0495_ptr='+Trim(sGrid.Cells[14,i]);
        DM.tmp.ExecSQL;
      end;
    end;

    modalresult:=mrok;
  except
    ON E:Exception do
    begin
      DM.ADOCon.RollbackTrans;
      showmessage('保存数据失败,错误:'+E.Message);
    end;
  end;
end;

procedure TFrm_detail.N5Click(Sender: TObject);
begin
  if EdtCut_no.Text='' then
    showmessage('请先输入生产单号!')
  else begin
    TForm1.InitEdt(edtcut_no.Tag,sGrid,EdtCut_no.Text,Edit1.text);
    SpeedButton1.Enabled:=sgrid.RowCount=2;
  end;
end;

procedure TFrm_detail.N2Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid.RowCount <= 2 then exit;
  if DM.ADO468_1.Locate('INVENT_PTR',strtoint(sGrid.Cells[7,sgrid.Row]),[]) then
  begin
    DM.ADO468_1.Delete;
    for i:=sgrid.Row to sgrid.RowCount-2 do sgrid.Rows[i].Text:=sgrid.Rows[i+1].Text;
    sgrid.RowCount:=sgrid.RowCount-1;
  end;
  if sgrid.RowCount <= 2 then CBFac.Enabled:= true;
end;


procedure TFrm_detail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_detail.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_detail.PopupMenu1Popup(Sender: TObject);
begin
  if Ftag=2 then abort;
  if Self.EdtCut_no.Text = '' then
  begin
    showmessage('请先选择生产单号');
    abort;
  end ;
  if Self.CBFac.Text = '' then
  begin
    showmessage('请先选择工厂');
    abort;
  end ;

  N2.Enabled:=not ((SGrid.Row=0) or (SGrid.Row=SGrid.RowCount-1));
end;

procedure TFrm_detail.SpeedButton1Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 with TfrmPick_Item_Single.Create(nil) do
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'CUT_NO/生产单号/100,SO_NO/订单号/100,PROD_CODE/工程编码/100,PRODUCT_NAME/工程名称/100,ISSUED_QTY/投产数量/60,ISSUE_DATE/投产日期/100,DEPT_NAME/生产部门/60,REMARK/备注/100';
      InputVar.Sqlstr :=Format('SELECT case when data0008.if_control=1 then  case when csi_ptr= %s then dbo.data0492.CUT_NO else ''*******'' end else dbo.data0492.CUT_NO end as CUT_NO, '+
                               'case when data0008.if_control=1 then  case when csi_ptr= %s then dbo.data0492.SO_NO else ''*******'' end else dbo.data0492.SO_NO end as SO_NO, '+
                               'case when data0008.if_control=1 then  case when csi_ptr= %s then dbo.Data0008.PROD_CODE else ''*******'' end else dbo.Data0008.PROD_CODE end as PROD_CODE, '+
                               'case when data0008.if_control=1 then  case when csi_ptr= %s then dbo.Data0008.PRODUCT_NAME else ''*******'' end else dbo.Data0008.PRODUCT_NAME end as PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC,'+
                      'dbo.data0492.PLANNED_QTY, dbo.data0492.ISSUED_QTY, dbo.data0492.SCH_COMPL_DATE, dbo.data0492.ISSUE_DATE, dbo.data0492.REMARK,'+
                      'dbo.data0492.WHOUSE_PTR, dbo.data0492.BOM_PTR,dbo.data0492.mrb_ptr, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, dbo.data0008.if_control, dbo.data0492.rkey  as rk492 '+
                      'FROM dbo.Data0008 INNER JOIN '+
                      'dbo.data0492 ON dbo.Data0008.RKEY = dbo.data0492.BOM_PTR '+
                      'INNER JOIN dbo.Data0034 ON dbo.data0492.mrb_ptr = dbo.Data0034.RKEY  left join '+
                      '(SELECT     CSI_PTR, PROC_PTR ' +
                      'FROM          dbo.WZCP0100  ' +
                      'WHERE      (CSI_PTR = %s )) AS cp100 on dbo.Data0008.RKEY = cp100.proc_ptr         '+
                      'WHERE (dbo.data0492.TSTATUS IN (0, 2)) order by dbo.data0492.CUT_NO',[rkey73,rkey73,rkey73,rkey73,rkey73]);
      inputvar.KeyField:='CUT_NO';
    end;

  end;
  InputVar.AdoConn := DM.ADOCon ;
  InitForm_New(InputVar);
  while ShowModal=mrok do
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         if adsPick.Fieldbyname('if_control').AsBoolean then
         begin
           if not DM.checkbomqry(adsPick.Fieldbyname('BOM_PTR').AsInteger) then
           begin
             ShowMessage(
            // rkey73+'@'+ adsPick.Fieldbyname('d08rk').AsString+':'+adsPick.Fieldbyname('if_control').AsString+#13#10+
             '该项目为管控项目，你的权限等级不允许操作该项目。');
             Continue;
           end;
         end;

         Edit1.Text:=adsPick.Fieldbyname('ISSUED_QTY').AsString;
         EdtDept.tag:=adsPick.Fieldbyname('mrb_ptr').AsInteger;
         EdtDept.Text:=trim(adsPick.FieldValues['Dept_code']);
         label6.Caption:=trim(adsPick.FieldValues['Dept_name']);
         EdtCut_no.tag:=adsPick.Fieldbyname('rk492').AsInteger;
         EdtCut_no.Text:=trim(adsPick.FieldValues['CUT_NO']);
         label9.Caption:=trim(adsPick.FieldValues['PROD_CODE'])+' '+trim(adsPick.FieldValues['PRODUCT_NAME']);
         Break;
       end;
    end;
  end ;
 finally
   Free ;
 end;

end;

procedure TFrm_detail.SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if Ftag=2 then exit;
  if (ARow<>SGrid.RowCount-1) and ((ACol=4) or (ACol=3)) then
    sGrid.Options:=sGrid.Options+[goEditing]
  else
    sGrid.Options:=sGrid.Options-[goEditing];
  SGrid.Refresh;
end;

procedure TFrm_detail.SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  CellString : string;
begin
  CellString := SGrid.Cells[ACol,ARow];
  if  ARow=0 then
    SGrid.Canvas.TextRect(rect,rect.left+(rect.right-rect.left-SGrid.Canvas.TextWidth(CellString)) div 2,
                               rect.top+(rect.bottom-rect.top-SGrid.Canvas.TextHeight(CellString)) div 2,CellString)
  else if (ARow>0) and (ACol=3) then    //数字居右
    SGrid.Canvas.TextRect(rect,rect.left+(rect.right-rect.left-SGrid.Canvas.TextWidth(CellString)),
                               rect.top+(rect.bottom-rect.top-SGrid.Canvas.TextHeight(CellString)) div 2,CellString);
end;

procedure TFrm_detail.CBFacChange(Sender: TObject);
begin
  CBFac.Tag:=FFac[CBFac.ItemIndex];
end;

procedure TFrm_detail.SGridKeyPress(Sender: TObject; var Key: Char);
begin
 if (SGrid.Col=3) then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',SGrid.Cells[SGrid.Col,SGrid.Row])>0  then abort;
end;

procedure TFrm_detail.SGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (SGrid.Col=3) and (SGrid.Row<>SGrid.RowCount-1) then
 begin
  if SGrid.Cells[3,SGrid.Row]='' then SGrid.Cells[3,SGrid.Row]:='0';
  if StrToFloat(SGrid.Cells[16,SGrid.Row])>StrToFloat(SGrid.Cells[12,SGrid.Row]) then
  begin
    if StrToFloat(SGrid.Cells[3,SGrid.Row])>(StrToFloat(SGrid.Cells[10,SGrid.Row])-StrToFloat(SGrid.Cells[11,SGrid.Row])) then
     SGrid.Cells[3,SGrid.Row] := FloatToStr((StrToFloat(SGrid.Cells[10,SGrid.Row])-StrToFloat(SGrid.Cells[11,SGrid.Row])));
//     SGrid.Cells[3,SGrid.Row] := SGrid.Cells[12,SGrid.Row];
  end else
  begin
    if StrToFloat(SGrid.Cells[3,SGrid.Row])>StrToFloat(SGrid.Cells[16,SGrid.Row]) then
     SGrid.Cells[3,SGrid.Row] := SGrid.Cells[16,SGrid.Row];
  end;
 end;
end;

procedure TFrm_detail.SGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if SGrid.Row <> SGrid.RowCount-1 then
if (key=13) and (SGrid.Col=3) then
 SGrid.Row:=SGrid.Row+1;
end;

procedure TFrm_detail.SpeedButton2Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'EMPL_CODE/员工编号/220,EMPLOYEE_NAME/员工姓名/230';
      InputVar.Sqlstr :='select rKey,EMPL_CODE,EMPLOYEE_NAME from data0005 order by EMPL_CODE';
      inputvar.KeyField:='EMPL_CODE';
    end;
                        //B000001-001
  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         Edit2.Text:=frmPick_Item_Single.adsPick.Fieldbyname('EMPL_CODE').AsString;
         Label13.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']);
         Edit2.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rKey').AsInteger;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;
end;

procedure TFrm_detail.btnBranchClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin
      frmPick_Item_Single := TfrmPick_Item_Single.Create(nil);
       try
          case Tcomponent(Sender).Tag of
            0:
              begin
                InputVar.Fields := 'Dept_code/部门编号/100,dept_name/部门名称/150,xz/性质/100';
                InputVar.Sqlstr :='select rkey,dept_code,dept_name,case when ttype=4 then ''部门'' '+
                                  'when ttype=5 then ''班组'' else ''工序'' end xz from data0034 where (ttype in (4,5) or is_cost_dept=1)'
                                  +' and (ACTIVE_FLAG=0) order by Dept_code';
                inputvar.KeyField := 'Dept_code';
              end;

          end;
          InputVar.AdoConn := DM.ADOCon;
          frmPick_Item_Single.InitForm_New(InputVar);
          if frmPick_Item_Single.ShowModal = mrok then
          begin
            Edit5.Text :=  trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
          end;
       finally
          frmPick_Item_Single.Free;
       end;

end;

end.
