unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB,StrUtils;

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
    EdtAud: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit5: TEdit;
    Label10: TLabel;
    BtnSave: TBitBtn;
    EdtDept: TEdit;
    SpeedButton1: TSpeedButton;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    CBFac: TComboBox;
    BitBtn7: TBitBtn;
    Label9: TLabel;
    Label12: TLabel;
    cbbKZXM: TComboBox;
    lbl1: TLabel;
    cbbBZ: TComboBox;
    Label11: TLabel;
    Edit1: TEdit;
    SpeedButton3: TSpeedButton;
    procedure BitBtn9Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EdtAudExit(Sender: TObject);
    procedure EdtDeptExit(Sender: TObject);
    procedure SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGridKeyPress(Sender: TObject; var Key: Char);
    procedure SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CBFacChange(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    //procedure SpeedButton3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Ffac:array[0..10] of integer;
    savable1 : integer;
    rkey136_1,so_no : string;
    procedure check_exist;
    procedure getso_reqmatrial(so:string;rkey34:Integer);
    function FillChanChuSheBei: Boolean;
  public
    Ftag:integer;
    FGrd:TDBGridEh;
    procedure initd;
    procedure DeleteFillKZXM;
  end;

var
  Frm_detail: TFrm_detail;
implementation
  uses DM_u,common,Pick_Item_Single,ConstVar,Frm_detailEdt_u,Frm_Out_u,Frm_Auth_u,
  Frm_prod;
  //UStan;

{$R *.dfm}

procedure TFrm_detail.initd;
var i,j:integer;
    QueryTmp:TADOQuery;
begin
  SGrid.ColCount:=7;
  SGrid.RowCount:=2;
  savable1 := -1;
  rkey136_1 := '';
  for i:=0 to 6 do
  begin
    SGrid.Cells[i,0]:=FGrd.Columns[i].Title.Caption;
    SGrid.ColWidths[i]:=FGrd.Columns[i].Width;
  end;

  SGrid.Cells[5,0]:='rkey17';
  SGrid.ColWidths[5]:=-1;
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select rkey,abbr_name from data0015 where active_flag = ' + QuotedStr('Y');
  DM.tmp.Open;
  i:=0;
  while not DM.tmp.Eof do
  begin
    Ffac[i]:=DM.tmp.Fields[0].AsInteger;
    CBFac.Items.Append(DM.tmp.Fields[1].asstring);
    DM.tmp.Next;
    inc(i);
  end;
  
  if Ftag=0 then
  begin
    self.Caption:='材料申领-新增';

    EdtDept.Text:=dept_code;
    label6.Caption:=Dept_name;
    EdtDept.Tag:=dept_rkey;
    FillChanChuSheBei;
    
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select data0094.rkey,data0094.code, data0094.PURCHASE_APPROV_DESC '+
                     'from data0094 inner join data0034 on data0094.dept_ptr=data0034.rkey '+
                     'where dbo.Data0094.type=2 and data0034.dept_code='''+dept_code+''' ';
    DM.tmp.Open;
    if DM.tmp.RecordCount=1 then
    begin
      EdtAud.Text:=DM.tmp.FieldValues['Code'];
      label4.Caption:=DM.tmp.FieldValues['PURCHASE_APPROV_DESC'];
      EdtAud.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
    end;

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
    //Edit1.Text := '';
    //Edit1.Hint := '';
    //Label11.Visible := False;
    //Edit1.Visible := False;
    //SpeedButton3.Visible := False;
  end
  else
   begin
    if Ftag=1 then
      self.Caption:='材料申领-修改'
    else
     if Ftag=2 then
     begin
      self.Caption:='材料申领-查看';
      BtnSave.Enabled:=false;
      SpeedButton1.Enabled:=false;
      SpeedButton2.Enabled:=false;
      SpeedButton3.Enabled:=False; //配料单选择按钮
      Edit1.Enabled:=False;       //配料单号
      EdtDept.Enabled:=false;
      EdtAud.Enabled:=false;
      self.Caption:='材料申领-修改';
      cbbBZ.Enabled := False;
     end
     else
      if Ftag=10 then
      self.Caption:='材料申领-复制';

    if DM.ADO268.FieldByName('control_ptr').AsString <> '' then
    begin
      QueryTmp:=TADOQuery.Create(Self);
      QueryTmp.Connection := DM.ADOCon;
      //Label11.Visible := True;
      //Edit1.Visible := True;
//              SpeedButton3.Visible := True;
      with QueryTmp do
      begin
            close;
            sql.Text:=' select rkey,control_name from data0136 where rkey = '+
            DM.ADO268.FieldByName('control_ptr').AsString+#13;
            Open;
            //Edit1.Hint :=    Fields[0].AsString;
            //Edit1.Text :=    Fields[1].AsString;
      end;
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
    end else begin    //COPY
      DM.ADO268_1.Close;
      DM.ADO268_1.Parameters[0].Value:=-1;
      DM.ADO268_1.Open;
      DM.ADO268_1.Append;
      for i:=0 to DM.ADO268_1.FieldCount-1 do
         if (uppercase(DM.ADO268_1.Fields[i].FullName)<>'RKEY') and (uppercase(DM.ADO268_1.Fields[i].FullName)<>'NUMBER') and
            (uppercase(DM.ADO268_1.Fields[i].FullName)<>'AUTH_DATE') and (uppercase(DM.ADO268_1.Fields[i].FullName)<>'AUTH_EMPLPTR') and 
            (uppercase(DM.ADO268_1.Fields[i].FullName)<>'PRTED')
         then
           DM.ADO268_1.Fields[i].Value:=DM.ADO268.fieldbyname(DM.ADO268_1.Fields[i].FullName).Value;
      DM.GetNo(MaskEdit1,'36',0);
      DM.ADO268_1.Fieldbyname('status').asinteger:=0;

      DM.tmp.Close;
      DM.tmp.SQL.Text:='select getdate()';
      DM.tmp.Open;
      DateTimePicker1.DateTime:=DM.tmp.Fields[0].AsDateTime;

      DM.ADO468_1.Close;
      DM.ADO468_1.Parameters[0].Value:=-1;
      DM.ADO468_1.Open;
      while not DM.ADO468.Eof do
      begin
        DM.ADO468_1.Append;
        for i:=0 to DM.ADO468_1.FieldCount-1 do
           if (uppercase(DM.ADO468_1.Fields[i].FullName)<>'RKEY') and (uppercase(DM.ADO468_1.Fields[i].FullName)<>'QUAN_ISSUED')
              and (uppercase(DM.ADO468_1.Fields[i].FullName)<>'STATUS') then
             DM.ADO468_1.Fields[i].Value:=DM.ADO468.fieldbyname(DM.ADO468_1.Fields[i].FullName).Value;
        DM.ADO468.Next;
      end;
    end;

    Edit5.Text:=DM.ADO268.Fieldbyname('reference').AsString;
    Edit1.Text:=dm.ADO268.Fieldbyname('cut_no').AsString;
    EdtDept.Text:=DM.ADO268.Fieldbyname('dept_code').AsString;
    label6.Caption:=DM.ADO268.Fieldbyname('Dept_name').AsString;
    EdtDept.Tag:=DM.ADO268.Fieldbyname('Dept_ptr').AsInteger;

    EdtAud.Text:=DM.ADO268.Fieldbyname('code').AsString;
    label4.Caption:=DM.ADO268.Fieldbyname('PURCHASE_APPROV_DESC').AsString;
    EdtAud.tag:=DM.ADO268.Fieldbyname('auth_ptr').AsInteger;
    FillChanChuSheBei;
    cbbBZ.Text := Edit5.Text;
    CBFac.Tag:=DM.ADO268.Fieldbyname('warehouse_ptr').AsInteger;
    for i:=0 to 4 do
      if CBFac.Tag=Ffac[i] then begin CBFac.ItemIndex:=i;break;end;

    if DM.ADO268_1.FieldByName('control_ptr').AsString <> '' then
    begin
              //Label11.Visible := True;
              //Edit1.Visible := True;
              //SpeedButton3.Visible := True;
    end;
    j:=1;
    DM.ADO468.First;
    so_no:=DM.ADO468.FieldByName('so_no').AsString;
    while not DM.ADO468.Eof do
    begin
      for i:=0 to 4 do
         SGrid.Cells[i,j]:=FGrd.Columns[i].Field.AsString;

      SGrid.Cells[5,j]:=DM.ADO468.fieldbyname('INVENT_PTR').AsString; //rkey17;
      if DM.ADO468.fieldbyname('PRINTIT').AsString = 'Y'  then
      SGrid.Cells[6,j]:= '普通库存'
      else if DM.ADO468.fieldbyname('PRINTIT').AsString = 'N'  then
       SGrid.Cells[6,j]:= 'VMI库存';
      SGrid.RowCount:=SGrid.RowCount+1;
      inc(j);
      DM.ADO468.Next;
    end;
   end;
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
var i:integer;
    QryTemp: TADOquery;

begin
  if SGrid.RowCount=2  then
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
  if EdtAud.Text='' then
  begin
    showmessage('审核流程不能为空...');
    exit;
  end;
  if CBFac.Text='' then
  begin
    showmessage('工厂不能为空...');
    exit;
  end;
  if cbbBZ.Text='' then
  begin
    if MessageBox(Handle,'备注为空，是否继续？','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then Exit;
  end;
  if cbbBZ.Items.Count > 0 then
  begin
    if Trim(cbbBZ.Text) = '' then
    begin
      ShowMessage('备注为空，请选一个备注');
      Exit;
    end;
  end;
  rkey136_1:='';
  check_exist;
  (*
  if (savable1 = 1) {and (Edit1.Hint = '')} then
  begin

            showmessage('您所属的部门以及所选的物料已有控制项目管制，请先选择相应的控制项目，谢谢');
            dm.ADO136.Close;
            DM.ADO136.SQL.Clear;
            DM.ADO136.SQL.Text :=  ' SELECT      dbo.DATA0136.rkey, dbo.Data0015.WAREHOUSE_NAME, dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.ABBR_NAME,  '+#13+
                                   ' dbo.DATA0136.stan_consume, dbo.DATA0136.warehouse_ptr, dbo.DATA0136.control_name, dbo.DATA0136.unit_ptr  '+#13+
                                   ' FROM         dbo.Data0015 INNER JOIN  '+#13+
                                   '  dbo.DATA0136 ON dbo.Data0015.RKEY = dbo.DATA0136.warehouse_ptr  '+#13+
                                   '  WHERE ( 1=1 ) '+#13+#13+#13;
            DM.ADO136.SQL.Text :=  DM.ADO136.SQL.Text + ' AND (dbo.DATA0136.rkey in ( '+LeftStr(rkey136_1,Length(rkey136_1)-2)+' )) '+#13+#13;
            //ShowMessage(DM.ADO136.SQL.Text);
            dm.ADO136.Open;
            //if (Edit1.Hint = '') then
            Self.SpeedButton3Click(nil);
            //Label11.Visible := True;
            //Edit1.Visible := True;
            //SpeedButton3.Visible := True;
//            if Edit1.Text= '' then
//            begin
//               Abort;
//            end;
            Abort;
  end;
  *)

  if Ftag=0 then DM.ADO268_1.Append else DM.ADO268_1.Edit;

  DM.ADO268_1.FieldByName('EMPL_PTR').AsString:=rkey05;
  DM.ADO268_1.FieldByName('DATE').AsDateTime:=DateTimePicker1.DateTime;
  DM.ADO268_1.FieldByName('dept_ptr').AsInteger:=EdtDept.Tag;
  DM.ADO268_1.FieldByName('auth_ptr').AsInteger:=EdtAud.Tag;
  DM.ADO268_1.FieldByName('status').AsInteger:=0;
  DM.ADO268_1.FieldByName('Reference').AsString:= cbbBZ.Text;//Edit5.Text;
  DM.ADO268_1.FieldByName('warehouse_ptr').AsInteger:=CBFac.Tag;
  DM.ADO268_1.FieldByName('allow_submit').AsInteger:= 0;
  if Trim(Edit1.Text)<>'' then  dm.ADO268_1.FieldByName('cut_no').AsString:=Trim(Edit1.Text)
  else  dm.ADO268_1.FieldByName('cut_no').Value:=NULL;
  if cbbKZXM.ItemIndex <> -1 then
  begin
        DM.ADO268_1.FieldByName('control_ptr').AsInteger:= Integer(cbbKZXM.Items.Objects[cbbKZXM.ItemIndex]);

       { QryTemp := TADOQuery.Create(Application);
        with QryTemp do
        begin

            Connection:=dm.ADOCon;
            Close;
            SQL.Clear;
            SQL.Text:=  'select  dbo.DATA0136.Important_mtl FROM  dbo.DATA0136 where dbo.DATA0136.rkey = '+inttostr(Integer((cbbKZXM.Items.Objects[cbbKZXM.ItemIndex])));
            Open;
            if  FieldByName('Important_mtl').AsInteger = 1 then
            begin
                DM.ADO268_1.FieldByName('allow_submit').AsInteger:= 3;
            end;
        end;
        QryTemp.Free;   }
  end;


  DM.ADOCon.BeginTrans;
  try
    if ((Ftag=0) or (Ftag=10)) and not DM.GetNo(MaskEdit1,'36',1) then  abort;
    DM.ADO268_1.FieldByName('NUMBER').AsString:=MaskEdit1.Text;
    DM.ADO268_1.Post;
    DM.ADO268_1.UpdateBatch(arAll);
    
    for i:=1 to SGrid.RowCount-2 do
      if DM.ADO468_1.Locate('invent_ptr',strtoint(sGrid.Cells[5,i]),[]) then
      begin
        DM.ADO468_1.Edit;
        DM.ADO468_1.FieldByName('flow_no').AsInteger:=DM.ADO268_1.FieldByName('rkey').AsInteger;
        DM.ADO468_1.FieldByName('dept_ptr').AsInteger:=EdtDept.Tag;
        DM.ADO468_1.FieldByName('quan_bom').AsString:=SGrid.Cells[2,i];
        DM.ADO468_1.FieldByName('vendor').AsString:=SGrid.Cells[3,i];
        if Trim(SGrid.Cells[6,i]) = '普通库存' then
         DM.ADO468_1.FieldByName('PRINTIT').AsString:='Y'
        else
         if Trim(SGrid.Cells[6,i]) = 'VMI库存' then
          DM.ADO468_1.FieldByName('PRINTIT').AsString:='N';
        DM.ADO468_1.FieldByName('quan_alloc').Value := 0;
        DM.ADO468_1.FieldByName('overproof').AsInteger:= 0;
        if Trim(Edit1.Text)<>'' then
        begin
          DM.ADO468_1.FieldByName('CUT_NO').AsString:= Trim(Edit1.Text);
          DM.ADO468_1.FieldByName('SO_NO').AsString:= so_no;
        end
        else
        begin
          DM.ADO468_1.FieldByName('CUT_NO').Value:= NULL;
          DM.ADO468_1.FieldByName('SO_NO').Value:= NULL;
        end;
        DM.ADO468_1.Post;
      end
      else
      begin
        DM.ADOCon.RollbackTrans;
        showmessage('错误...');
        abort;
      end;
    DM.ADO468_1.UpdateBatch(arAll);
    DM.ADOCon.CommitTrans;
    Frkey268:=DM.ADO268_1.FieldByName('rkey').asinteger;
    modalresult:=mrok;
  except
    DM.ADOCon.RollbackTrans;
    showmessage('保存数据失败...');
  end;

end;

procedure TFrm_detail.N5Click(Sender: TObject);
begin
  TFrm_detailEdt.InitEdt(edtDept.Tag,sGrid,CBFac.ItemIndex);
    if sgrid.RowCount > 2 then
  CBFac.Enabled := False;
end;

procedure TFrm_detail.N2Click(Sender: TObject);
var
 i:byte;
 tmpcounter: Integer;
begin
  if sgrid.RowCount <= 2 then  exit;

  if DM.ADO468_1.Locate('invent_PTR',strtoint(sGrid.Cells[5,sgrid.Row]),[]) then
  begin
    DM.ADO468_1.Delete;
    for i:=sgrid.Row to sgrid.RowCount-2 do sgrid.Rows[i].Text:=sgrid.Rows[i+1].Text;
    sgrid.RowCount:=sgrid.RowCount-1;
  end;
  if sgrid.RowCount <= 2 then
   begin
   CBFac.Enabled:= true;
   Edit1.Text:='';
   Edit1.Enabled:=true;
   SpeedButton3.Enabled:=true;
   end;
  //Edit1.Text := '';
  //Edit1.Hint := '';
  savable1 := -1;
  rkey136_1 := '';
  //Label11.Visible := False;
  //Edit1.Visible := False;
  //SpeedButton3.Visible := False;
  DeleteFillKZXM;
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
  N2.Enabled:=not ((SGrid.Row=0) or (SGrid.Row=SGrid.RowCount-1));

  if Self.CBFac.Text = '' then
  begin
        showmessage('请先选择工厂');
        N5.Enabled := False ;
  end else   N5.Enabled := True ;
//  N1.Enabled:=N2.Enabled;
end;

procedure TFrm_detail.SGridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
//var
// column,row:longint;//右键选择stringgrid控件的方法
begin
{ if button=mbright then
 begin
  SGrid.MouseToCell(x,y,column,row);
  if row<>0 then SGrid.Row:=row;
 end;
}
end;

procedure TFrm_detail.SpeedButton1Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'Dept_code/部门编号/100,dept_name/部门名称/150,xz/性质/100';
      InputVar.Sqlstr :='select rkey,dept_code,dept_name,case when ttype=4 then ''部门'' '+
      'when ttype=5 then ''班组'' else ''工序'' end xz from data0034 where (ttype in (4,5) or is_cost_dept=1)'
      +' and (ACTIVE_FLAG=0)';
      inputvar.KeyField:='Dept_code';
    end;

  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         EdtDept.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_code']);
         label6.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
         EdtDept.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;

         DM.tmp.Close;
         DM.tmp.SQL.Text:='select data0094.rkey,data0094.code, data0094.PURCHASE_APPROV_DESC '+
                         'from data0094 inner join data0034 on data0094.dept_ptr=data0034.rkey '+
                         'where dbo.Data0094.type=2 and data0034.dept_code='''+EdtDept.Text+''' ';
         DM.tmp.Open;
         if DM.tmp.RecordCount=1 then
         begin
           EdtAud.Text:=DM.tmp.FieldValues['Code'];
           label4.Caption:=DM.tmp.FieldValues['PURCHASE_APPROV_DESC'];
           EdtAud.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
         end
         else
          begin
           EdtAud.Text:='';
           label4.Caption:='';
           EdtAud.tag:=0;
          end;
       end;
    end;
    FillChanChuSheBei;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;

  savable1 := -1;
  rkey136_1 := '';

end;

procedure TFrm_detail.EdtAudExit(Sender: TObject);
begin
   if (EdtAud.Text='') or (Ftag=3)  then exit;
   if EdtDept.Text='' then
   begin
     showmessage('请先输入部门代码...');
     exit;
   end;
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select data0094.rkey,data0094.code, data0094.PURCHASE_APPROV_DESC '+
                    'from data0094 inner join data0034 on data0094.dept_ptr=data0034.rkey '+
                    'where data0034.dept_code='''+EdtDept.Text+''' and data0094.code='''+EdtAud.Text+'''';
   DM.tmp.Open;
   if DM.tmp.IsEmpty then
   begin
     messagedlg('审批代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label4.Caption := '';
     EdtAud.SetFocus;
   end else begin
     EdtAud.Text:=DM.tmp.FieldValues['Code'];
     label4.Caption:=DM.tmp.FieldValues['PURCHASE_APPROV_DESC'];
     EdtAud.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
   end;
end;

procedure TFrm_detail.EdtDeptExit(Sender: TObject);
begin
  if (Ftag=3) then exit;

  if (EdtDept.Text='') then
   begin
     label6.Caption:='';
     EdtDept.tag:=0;
     exit;
   end;

   DM.tmp.Close;
   DM.tmp.SQL.Text:='select rkey,dept_code,dept_name from data0034 where (ttype in (4,5) or is_cost_dept=1) '+
                    'and dept_code='''+EdtDept.Text+'''';
   DM.tmp.Open;
   if DM.tmp.IsEmpty then
   begin
     messagedlg('部门代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label6.Caption := '';
     EdtDept.SetFocus;
   end
   else
    begin
     EdtDept.Text:=DM.tmp.FieldValues['dept_code'];
     label6.Caption:=DM.tmp.FieldValues['dept_name'];
     EdtDept.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
     DM.tmp.Close;
     DM.tmp.SQL.Text:='select data0094.rkey,data0094.code, data0094.PURCHASE_APPROV_DESC '+
                     'from data0094 inner join data0034 on data0094.dept_ptr=data0034.rkey '+
                     'where dbo.Data0094.type=2 and data0034.dept_code='''+EdtDept.Text+''' ';
     DM.tmp.Open;
     if DM.tmp.RecordCount=1 then
      begin
       EdtAud.Text:=DM.tmp.FieldValues['Code'];
       label4.Caption:=DM.tmp.FieldValues['PURCHASE_APPROV_DESC'];
       EdtAud.tag:=DM.tmp.Fieldbyname('rkey').AsInteger;
      end
     else
      begin
         EdtAud.Text:='';
         label4.Caption:='';
         EdtAud.tag:=0;
      end;
     FillChanChuSheBei;  //加载部门设备清单最多四个设备
    end;
end;

procedure TFrm_detail.SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if Ftag=2 then exit;
  if (ARow<>SGrid.RowCount-1) and ((ACol=2) or (ACol=3)) then
    sGrid.Options:=sGrid.Options+[goEditing]
  else
    sGrid.Options:=sGrid.Options-[goEditing];
end;

procedure TFrm_detail.SGridKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ftag<>2) and (sGrid.Col=2)  then
  begin
    if not (key in ['0'..'9','.',#8]) then abort;
  end;
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
  else if (ARow>0) and (ACol=2) then    //数字居右
    SGrid.Canvas.TextRect(rect,rect.left+(rect.right-rect.left-SGrid.Canvas.TextWidth(CellString)),
                               rect.top+(rect.bottom-rect.top-SGrid.Canvas.TextHeight(CellString)) div 2,CellString);
end;

procedure TFrm_detail.SpeedButton2Click(Sender: TObject);
begin
  if EdtDept.Text='' then
   showmessage('请先输入部门代码...')
  else
    TFrm_Auth.getAuth(EdtDept.Text,EdtAud,self.Label4);

  //Edit1.Text := '';
  //Edit1.Hint := '';
  savable1 := -1;
  rkey136_1 := '';
  //Label11.Visible := False;
  //Edit1.Visible := False;
  //SpeedButton3.Visible := False;
end;

procedure TFrm_detail.CBFacChange(Sender: TObject);
begin
  CBFac.Tag:=FFac[CBFac.ItemIndex];
end;

procedure TFrm_detail.BitBtn7Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'Dept_code/部门编号/100,dept_name/部门名称/150,xz/性质/100';
      InputVar.Sqlstr :='select rkey,dept_code,dept_name,case when ttype=4 then ''部门'' '+
      'when ttype=5 then ''班组'' else ''工序'' end xz from data0034 where (ttype in (4,5) or is_cost_dept=1)'
      +' and (ACTIVE_FLAG=0)';
      inputvar.KeyField:='Dept_code';
    end;

  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
        //Edit5.Text:= '';
        cbbBZ.Text:='使用部门: '+trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;

end;

procedure TFrm_detail.check_exist;
var
  QueryTmp:TADOQuery;
  i : Integer;
begin
    QueryTmp:=TADOQuery.Create(Self);
    QueryTmp.Connection := DM.ADOCon;
    for i:= 1 to SGrid.RowCount-1 do
    begin
               if  (inttostr(EdtDept.tag) <> '') and (trim(SGrid.Cells[5,i]) <> '')
               and (CBFac.Tag <> 0) then
               begin
                       with QueryTmp do
                       begin
                              try
                                  close;
                                  sql.Text:=' ( '+
                                            ' SELECT     dbo.DATA0136.rkey '+
                                            ' FROM         dbo.DATA0136 LEFT JOIN '+
                                            '                      dbo.DATA0154 ON dbo.DATA0136.rkey = dbo.DATA0154.control_ptr '+
                                            ' WHERE (dbo.DATA0154.dept_ptr = '+inttostr(EdtDept.tag)+' ) AND ( dbo.DATA0136.warehouse_ptr = '+inttostr(CBFac.Tag)+'  ))  '+
                                            ' INTERSECT '+
                                            ' ( '+
                                            ' SELECT     dbo.DATA0136.rkey '+
                                            ' FROM         dbo.DATA0136 LEFT OUTER JOIN '+
                                            '                       dbo.DATA0155 ON dbo.DATA0136.rkey = dbo.DATA0155.control_ptr '+
                                            ' WHERE (dbo.DATA0155.invt_ptr = '+SGrid.Cells[5,i]+' ) AND ( dbo.DATA0136.warehouse_ptr = '+inttostr(CBFac.Tag)+'  ))  '+#13;
                                  //ShowMessage(sql.Text);
                                  Open;
                                  if (IsEmpty) and (rkey136_1 = '') then
                                  begin
                                      savable1 := 0;
                                      rkey136_1 := '';
                                  end else begin
                                       savable1 := 1;
                                       First;
                                       while not Eof do
                                       begin
                                              rkey136_1 := rkey136_1 + Fields[0].AsString + ' , ';
                                              Next;
                                       end;
                                  end;
                              except
                               DM.ADOCon.RollbackTrans;
                               showmessage('读取数据失败，请联系管理员');
                              end;
                       end;
               end;
    end;
    QueryTmp.Free;
end;

//procedure TFrm_detail.SpeedButton3Click(Sender: TObject);
//begin
//  check_exist;
//  if savable1 = 1 then
//  begin
//       with TStanForm.Create(nil) do
//       try
//            dm.ADO136.Close;
//            DM.ADO136.SQL.Text :=  DM.ADO136.SQL.Text + ' AND (dbo.DATA0136.rkey in ( '
//            +LeftStr(rkey136_1,Length(rkey136_1)-2)+' )) '+#13+#13;
//            dm.ADO136.Open;
//         if showmodal=mrok then
//         begin
//              Edit1.Text := '';
//              Edit1.Hint := '';
//              Edit1.Text := dm.ADO136.Fieldbyname('control_name').AsString;
//              Edit1.Hint := dm.ADO136.Fieldbyname('rkey').AsString;
//         end;
//       finally
//         free;
//       end;
//  end else begin
//      showmessage('该部门与该材料没有相关的控制项目');
//     exit;
//  end;

//end;

procedure TFrm_detail.Edit1Exit(Sender: TObject);
begin
 if (Trim(Edit1.Text)<>'') then
  begin
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select rkey,CUT_NO,SO_NO from data0492 where TSTATUS in (0,2)'+
                    'and ttype<>3 and CUT_NO ='''+Trim(Edit1.Text)+'''';
   DM.tmp.Open;
   if not DM.tmp.IsEmpty then
    begin
     Self.getso_reqmatrial(dm.tmp.fieldbyname('so_no').AsString,EdtDept.Tag);
    end
   else
    begin
      messagedlg('生产单号不正确,请重新输入或选择',mtinformation,[mbok],0);
      Edit1.SetFocus;
    end;
  end;
end;

procedure TFrm_detail.DeleteFillKZXM;
var
  LS: TStringList;
  I: Integer;
  tmpIndex: Integer;
  J: Integer;
begin
  Frm_detail.cbbKZXM.Items.Clear;
  for J := 1 to SGrid.RowCount - 1 do
  begin
  if Trim(SGrid.Cells[5,J]) = '' then Continue;
  DM.adsKZXM.Close;
  DM.adsKZXM.Parameters.ParamByName('PRKey17').Value := SGrid.Cells[5,J] ;
  DM.adsKZXM.Parameters.ParamByName('PRKey15').Value := Ffac[Frm_detail.CBFac.ItemIndex];
  DM.adsKZXM.Parameters.ParamByName('PRKey34').Value := Frm_detail.EdtDept.Tag;
  DM.adsKZXM.Open;
  if DM.adsKZXM.IsEmpty then Exit;
  if Frm_detail.cbbKZXM.Items.Count = 0 then
  begin
    while not DM.adsKZXM.Eof do
    begin
      Frm_detail.cbbKZXM.AddItem(DM.adsKZXM.fieldbyname('control_name').AsString,Pointer(DM.adsKZXM.fieldbyname('RKey').asInteger));
      DM.adsKZXM.Next;
    end;
    Frm_detail.cbbKZXM.ItemIndex := 0;
  end else
  begin
    LS := TStringList.Create;
    try
    while not DM.adsKZXM.Eof do
    begin
      for I := 0 to Frm_detail.cbbKZXM.Items.Count - 1 do
      begin
        if Integer(Frm_detail.cbbKZXM.Items.Objects[I]) = DM.adsKZXM.fieldbyname('RKey').asInteger then
        begin
          LS.AddObject(Frm_detail.cbbKZXM.Items[I],Frm_detail.cbbKZXM.Items.Objects[I]);
        end;
      end;
      DM.adsKZXM.Next;
    end;
    if LS.Count = 0 then
    begin
      //ShowMessage('一张配料单中不能有2种不同控制项目的材料');

    end else
    begin
      tmpIndex := Frm_detail.cbbKZXM.ItemIndex;
      Frm_detail.cbbKZXM.Items.Clear;
      Frm_detail.cbbKZXM.Items.Assign(LS);
      if Frm_detail.cbbKZXM.Items.Count -1 >= tmpIndex then
      begin
        Frm_detail.cbbKZXM.ItemIndex := tmpIndex;
      end else
        Frm_detail.cbbKZXM.ItemIndex := 0;
    end;
    finally
      LS.Free;
    end;
  end;
  end;
end;

function TFrm_detail.FillChanChuSheBei: Boolean;
begin
  cbbBZ.Items.Clear;
  DM.qrytmp.Close;
  DM.qrytmp.SQL.Clear;
  dm.qrytmp.SQL.Add('select SETUP_TIME_PER_LOT,QUEUE_TIME,PROCESS_TIME,PROCESS_TIME_B from data0034 where rkey = ' + IntToStr(EdtDept.tag));
  dm.qrytmp.Open;
  if Trim(DM.qrytmp.fieldbyname('SETUP_TIME_PER_LOT').AsString) <> '' then
    cbbBZ.Items.Add(DM.qrytmp.fieldbyname('SETUP_TIME_PER_LOT').AsString);
  if Trim(DM.qrytmp.fieldbyname('QUEUE_TIME').AsString) <> '' then
    cbbBZ.Items.Add(DM.qrytmp.fieldbyname('QUEUE_TIME').AsString);
  if Trim(DM.qrytmp.fieldbyname('PROCESS_TIME').AsString) <> '' then
    cbbBZ.Items.Add(DM.qrytmp.fieldbyname('PROCESS_TIME').AsString);
  if Trim(DM.qrytmp.fieldbyname('PROCESS_TIME_B').AsString) <> '' then
    cbbBZ.Items.Add(DM.qrytmp.fieldbyname('PROCESS_TIME_B').AsString);
  DM.qrytmp.Close;
  Result := True;
end;

procedure TFrm_detail.SpeedButton3Click(Sender: TObject);
begin
 if Trim(EdtDept.Text)='' then
  MessageDlg('请首先确认领料部门!',mtError,[mbCancel],0)
 else
 try
  Prod_Frm:=TProd_Frm.Create(nil);
  if Trim(Edit1.Text) <> '' then
   Prod_Frm.Edit1.Text := Edit1.Text
  else
   Prod_Frm.Edit1.Text := '';
  if Prod_Frm.ShowModal=mrok then
   begin
     Edit1.Text := Prod_Frm.ADO492CUT_NO.AsString;
     so_no:= Prod_Frm.ADO492SO_NO.Value;
     Self.getso_reqmatrial(Prod_Frm.ADO492SO_NO.Value,EdtDept.Tag); //得到销售订单物料需求
   end;
 finally
  Prod_Frm.Free;
 end;
end;

procedure TFrm_detail.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Trim(EdtDept.Text)='' then
 begin
   MessageDlg('请首先确认领料部门!',mtError,[mbCancel],0);
   Edit1.Text:='';
   EdtDept.SetFocus;
 end;
end;

procedure TFrm_detail.getso_reqmatrial(so: string; rkey34: Integer);
begin
with dm.tmp1 do
begin
 Close;
 sql.Text:='SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION,'+
 'dbo.DATA0403.VENDOR, dbo.Data0002.UNIT_NAME, dbo.DATA0403.rkey17,'+
 'dbo.DATA0403.QTY_BOM - dbo.DATA0403.QUAN_ISSUED AS req_qty '+
 'FROM   dbo.DATA0403 INNER JOIN '+
 ' dbo.Data0017 ON dbo.DATA0403.rkey17 = dbo.Data0017.RKEY INNER JOIN '+
 ' dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY '+
 'INNER JOIN  dbo.Data0060 ON dbo.DATA0403.rkey60 = dbo.Data0060.RKEY '+
 'where (Data0060.SALES_ORDER='+QuotedStr(so)+')'+
 ' and (DATA0403.rkey34='+inttostr(rkey34)+')'+
 ' and (data0403.STATUS=0) and (DATA0403.QTY_BOM - DATA0403.QUAN_ISSUED >0) ';
 Open;
 while not Eof do
 begin
    SGrid.Cells[0,SGrid.RowCount-1]:=Fieldbyname('INV_PART_NUMBER').AsString;
    SGrid.Cells[1,SGrid.RowCount-1]:=Fieldbyname('INV_PART_DESCRIPTION').AsString;
    SGrid.Cells[2,SGrid.RowCount-1]:=Fieldbyname('req_qty').AsString;
    SGrid.Cells[3,SGrid.RowCount-1]:=Fieldbyname('VENDOR').AsString;    //备注
    SGrid.Cells[4,SGrid.RowCount-1]:=Fieldbyname('unit_name').AsString;
    SGrid.Cells[5,SGrid.RowCount-1]:=Fieldbyname('rkey17').AsString;
    SGrid.Cells[6,SGrid.RowCount-1]:='普通库存';

    SGrid.RowCount:=SGrid.RowCount+1;

    DM.ADO468_1.Append;
    DM.ADO468_1.FieldByName('INVENT_PTR').AsString:=Fieldbyname('rkey17').AsString;
    DM.ADO468_1.FieldByName('quan_bom').AsString:=Fieldbyname('req_qty').AsString;
    DM.ADO468_1.FieldByName('VENDOR').AsString:=Fieldbyname('VENDOR').AsString;
    DM.ADO468_1.FieldByName('SO_NO').AsString:=so;

    DM.ADO468_1.FieldByName('step').AsInteger:=0;
    DM.ADO468_1.FieldByName('dept_ptr').AsInteger:=rkey34;
    DM.ADO468_1.FieldByName('invent_or').AsInteger:=0;

    DM.ADO468_1.Post;

   Next;
 end;
 if not IsEmpty then
  begin
   SpeedButton3.Enabled:=False;
   Edit1.Enabled:=False;
  end;
end;

end;

end.
