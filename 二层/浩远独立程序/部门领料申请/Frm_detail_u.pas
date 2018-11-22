unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB;

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
    Edit1: TEdit;
    Label9: TLabel;
    SpeedButton3: TSpeedButton;
    Label11: TLabel;
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
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    Ffac:array[0..4] of integer;
  public
    Ftag:integer;
    FGrd:TDBGridEh;
    procedure initd;
  end;

implementation
  uses DM_u,common,Pick_Item_Single,ConstVar,Frm_detailEdt_u,Frm_Out_u,Frm_Auth_u,Frm_Prod;

{$R *.dfm}

procedure TFrm_detail.initd;
var i,j:integer;
begin
  SGrid.ColCount:=6;
  SGrid.RowCount:=2;
  for i:=0 to 4 do
  begin
    SGrid.Cells[i,0]:=FGrd.Columns[i].Title.Caption;
    SGrid.ColWidths[i]:=FGrd.Columns[i].Width;
  end;

  SGrid.Cells[5,0]:='rkey17';
  SGrid.ColWidths[5]:=-1;

  DM.tmp.Close;
  DM.tmp.SQL.Text:='select rkey,abbr_name from data0015';
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
  end else begin
    if Ftag=1 then
    begin
      self.Caption:='材料申领-修改';
    end else if Ftag=2 then begin
      self.Caption:='材料申领-查看';
      BtnSave.Enabled:=false;
      SpeedButton1.Enabled:=false;
      SpeedButton2.Enabled:=false;
      EdtDept.Enabled:=false;
      EdtAud.Enabled:=false;
    end else if Ftag=10 then
      self.Caption:='材料申领-复制';


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

    EdtDept.Text:=DM.ADO268.Fieldbyname('dept_code').AsString;
    label6.Caption:=DM.ADO268.Fieldbyname('Dept_name').AsString;
    EdtDept.Tag:=DM.ADO268.Fieldbyname('Dept_ptr').AsInteger;

    EdtAud.Text:=DM.ADO268.Fieldbyname('code').AsString;
    label4.Caption:=DM.ADO268.Fieldbyname('PURCHASE_APPROV_DESC').AsString;
    EdtAud.tag:=DM.ADO268.Fieldbyname('auth_ptr').AsInteger;

    CBFac.Tag:=DM.ADO268.Fieldbyname('warehouse_ptr').AsInteger;

    if not DM.ADO268.Fieldbyname('CUT_NO').IsNull  then
    begin
        DM.tmp.Close;
        DM.tmp.SQL.Clear;
        DM.tmp.SQL.Text:='select CUT_NO from data0492 WHERE CUT_NO = '''+DM.ADO268.Fieldbyname('CUT_NO').AsString+'''' ;
        DM.tmp.Open;
        Edit1.Text := DM.tmp.Fields[0].AsString;
        DM.tmp.Close;
        DM.tmp.SQL.Clear;
    end;
    for i:=0 to 4 do
      if CBFac.Tag=Ffac[i] then begin CBFac.ItemIndex:=i;break;end;
    j:=1;
    DM.ADO468.First;
    while not DM.ADO468.Eof do
    begin
      for i:=0 to 4 do
         SGrid.Cells[i,j]:=FGrd.Columns[i].Field.AsString;

      SGrid.Cells[5,j]:=DM.ADO468.fieldbyname('INVENT_PTR').AsString; //rkey17;
      SGrid.RowCount:=SGrid.RowCount+1;
      inc(j);
      DM.ADO468.Next;
    end;
  end;
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
var i:integer;
begin
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
  if Ftag=0 then DM.ADO268_1.Append else DM.ADO268_1.Edit;
  DM.ADO268_1.FieldByName('EMPL_PTR').AsString:=rkey05;
  DM.ADO268_1.FieldByName('DATE').AsDateTime:=DateTimePicker1.DateTime;
  DM.ADO268_1.FieldByName('dept_ptr').AsInteger:=EdtDept.Tag;
  DM.ADO268_1.FieldByName('auth_ptr').AsInteger:=EdtAud.Tag;
  DM.ADO268_1.FieldByName('status').AsInteger:=0;
  DM.ADO268_1.FieldByName('Reference').AsString:=Edit5.Text;
  DM.ADO268_1.FieldByName('warehouse_ptr').AsInteger:=CBFac.Tag;
  if  trim(Edit1.Text) <> '' then
  DM.ADO268_1.FieldByName('CUT_NO').AsString:= trim(Edit1.Text)
  else
  DM.ADO268_1.FieldByName('CUT_NO').Value:= null;
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
        DM.ADO468_1.Post;
      end else begin
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
  if CBFac.Text <> '' then
  begin
    TFrm_detailEdt.InitEdt(edtDept.Tag,sGrid,CBFac.ItemIndex);
    if sgrid.RowCount > 2 then
        CBFac.Enabled := False;
  end else
      showmessage('工厂不能为空，请先选择工厂');
end;

procedure TFrm_detail.N2Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid.RowCount <= 2 then exit;
  if DM.ADO468_1.Locate('invent_PTR',strtoint(sGrid.Cells[5,sgrid.Row]),[]) then
  begin
    DM.ADO468_1.Delete;
    for i:=sgrid.Row to sgrid.RowCount-2 do sgrid.Rows[i].Text:=sgrid.Rows[i+1].Text;
    sgrid.RowCount:=sgrid.RowCount-1;
  end;
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
//  N1.Enabled:=N2.Enabled;
end;

procedure TFrm_detail.SGridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
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
      +' and (ACTIVE_FLAG=0) order by Dept_code';
      inputvar.KeyField:='Dept_code';
    end;

  end;
  inputvar.InPut_value:=edtdept.Text;
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
         end else begin
           EdtAud.Text:='';
           label4.Caption:='';
           EdtAud.tag:=0;
         end;
       end;  
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;

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
   if (EdtDept.Text='') or (Ftag=3) then exit;
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select rkey,dept_code,dept_name from data0034 where (ttype in (4,5) or is_cost_dept=1) '+
                    'and dept_code='''+EdtDept.Text+'''';
   DM.tmp.Open;
   if DM.tmp.IsEmpty then
   begin
     messagedlg('部门代码不正确,请重新输入或选择',mtinformation,[mbok],0);
     label6.Caption := '';
     EdtDept.SetFocus;
   end else begin
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
       end else begin
         EdtAud.Text:='';
         label4.Caption:='';
         EdtAud.tag:=0;
       end;
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
end;

procedure TFrm_detail.CBFacChange(Sender: TObject);
begin
  CBFac.Tag:=FFac[CBFac.ItemIndex];
end;

procedure TFrm_detail.SpeedButton3Click(Sender: TObject);
begin
      //TProd_Form.init;//(edtDept.Tag,sGrid,CBFac.ItemIndex);
      Prod_Form:=TProd_Form.Create(nil);
      if Trim(Edit1.Text) <> '' then
      Prod_Form.Edit1.Text := Edit1.Text
      else
      Prod_Form.Edit1.Text := '';
      if Prod_Form.ShowModal=mrok then
      begin
            if not DM.ADO492.IsEmpty then
            begin
                Edit1.Clear;
                Edit1.Text := DM.ADO492CUT_NO.AsString;
            end;
      end;


end;

procedure TFrm_detail.Edit1Exit(Sender: TObject);
begin
   if (Trim(Edit1.Text)='') then exit;
   DM.tmp.Close;
   DM.tmp.SQL.Text:='select rkey,CUT_NO from data0492 where TSTATUS in (0,2)'+
                    'and CUT_NO ='''+Trim(Edit1.Text)+'''';
   DM.tmp.Open;
   if DM.tmp.IsEmpty then
   begin
        messagedlg('生产单号不正确,请重新输入或选择',mtinformation,[mbok],0);
        Edit1.SetFocus;
   end else begin
        Edit1.Text:=DM.tmp.FieldValues['CUT_NO'];
   end;
end;

end.
