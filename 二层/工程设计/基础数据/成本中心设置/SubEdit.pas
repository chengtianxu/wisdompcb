{/****** 使用的表如下：
      Data0034(主表):单个工序生产表
      Data0498(从，一类材料表),
      Data0495(从，二类材料表),
      Data0506(从，制程参数表,TType=3)
      Data0017：原材料明细表
      Data0499:材料类别表，工程参数表}


unit SubEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DB, ADODB, StdCtrls, DBCtrls, Mask, Buttons,
  ToolWin, ImgList, Grids, DBGridEh, DBGrids, Menus;

type
  TfrmSubEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtDeptCode: TEdit;
    Label46: TLabel;
    DBEdit4: TDBEdit;
    TabSheet5: TTabSheet;
    GroupBox2: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ToolBar1: TToolBar;
    btnSave: TToolButton;
    btnExit: TToolButton;
    DBGridEh1: TDBGridEh;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Combobox3: TComboBox;
    SpeedButton15: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    Memo1: TDBMemo;
    ComboBox1: TComboBox;
    Label9: TLabel;
    Label17: TLabel;
    ComboBox2: TComboBox;
    DBGridEh3: TDBGridEh;
    DBGrid1: TDBGrid;
    Label11: TLabel;
    GroupBox4: TGroupBox;
    DBCheckBox9: TDBCheckBox;
    edt_Cost_Dept_Code: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btnCancel: TToolButton;
    edtAcctNo: TEdit;
    labelAcctName: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    TabSheet6: TTabSheet;
    GroupBox5: TGroupBox;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBCheckBox10: TDBCheckBox;
    N5: TMenuItem;
    lbl1: TLabel;
    edtOVERHEAD3_FORMULA: TDBEdit;
    lbl2: TLabel;
    edtOVERHEAD3_FORMULA1: TDBEdit;
    N6: TMenuItem;
    procedure btnExitClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit5Enter(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
    KeyValue:integer;
    procedure SetAllRKeyExpr;//显示所有因rKey而需要显示的额外信息
    procedure CopyInfo(tmp_value:string);  //复制二类原材料
  public
    { Public declarations }
    EnterMode,rkey34:integer;
    procedure Enter(pEnterMode:byte;pValue:integer);//窗口初始化
  end;

var
  frmSubEdit: TfrmSubEdit;

implementation
uses dm,common,ConstVar,MyClass,AcctSearch,Pick_Item_Single;
{$R *.dfm}

{ TfrmSubEdit }

procedure TfrmSubEdit.Enter(pEnterMode: byte; pValue: integer);
var
  aqQuery:TAdoQuery;
//  QryTmp:TAdoQuery;
begin
//  BtnCancel.Enabled:= BtnSave.Enabled;
  PageControl1.ActivePageIndex:=1;
  EnterMode:=pEnterMode;
  KeyValue:= pValue;
  if EnterMode = em_Add then //1.浏览 2.新增 3.编辑
  begin
    dmCon.adsMaster.Append; //data0034 ttype=4
    caption := caption + ' [新增]';
  end
  else
  begin
    MyDataClass.OpenDataSetByPara(pValue,dmcon.adsMaster);
    SetAllRKeyExpr;
  end;
  if EnterMode <> em_Browse then
  begin
    try
      aqQuery:= TadoQuery.Create(self);
      aqQuery.Connection := dmcon.ADOConnection1;
      //加载工程表单
      Get_Eng_Table_Formula_List(aqQuery);
      aqQuery.First;
      while not aqQuery.Eof do begin
        Combobox3.Items.Add(aqQuery.fieldbyName('FXY').AsString);
        aqQuery.next;
      end;
      //加载局部制程参数
      MyDataclass.OpenQuery(aqQuery,'select d.parameter_name from data0506 m inner join data0278 d on m.parameter_ptr=d.rkey '+
                            ' where m.ttype=3 and source_ptr='+IntToStr(KeyValue));
      ComboBox1.Items.Clear;
      while not aqQuery.Eof do begin
        ComboBox1.Items.Add('PD.'+trim(aqQuery.fieldByName('parameter_name').AsString));
        aqQuery.next;
      end;

    finally
      aqQuery.close;
      aqQuery.free;
    end;
  end;
  if EnterMode =em_Browse  then //浏览
  begin
    caption := caption + ' [浏览]';
  end else if enterMode=em_edit then
    caption := caption + ' [修改]';
  Memo1.ReadOnly := (EnterMode = em_browse);
  DBGridEh1.ReadOnly := Memo1.ReadOnly;
  DBGrid1.ReadOnly := Memo1.ReadOnly;
  GroupBox4.Enabled := not Memo1.ReadOnly;
  GroupBox5.Enabled := not Memo1.ReadOnly;
  ShowModal;
end;

procedure TfrmSubEdit.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSubEdit.SpeedButton1Click(Sender: TObject);
var
  InputVar:PDlgInput;
  tmp_Value:string;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'Dept_Code/成本中心编号/180,Dept_Name/成本中心名称/250';
    InputVar.Sqlstr := ' select rKey,Dept_Code,Dept_Name,cost_name,OVERHEAD_FORMULA,OVERHEAD2_FORMULA,OVERHEAD3_FORMULA  '+ #13+
                       ' from data0034 where Is_Cost_Dept=1 and ( cost_dept_ptr=rkey or rkey = ' + IntToStr(rkey34) + ' ) '+ #13+
                       ' order by dept_code ';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dmCon.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      tmp_value:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsString;
    //  tmp_value:= Pick_Cost_Dept('',dmcon.ADOConnection1,1);
      if tmp_value = '' then exit;
      with dmcon do
      begin
        adsMaster.Edit;
        adsMaster.FieldByName('Cost_Dept_ptr').Asstring := tmp_value;
//        qryTmp.close;
//        qryTmp.SQL.Clear;
//        qryTmp.Sql.Add('select Dept_Code,Dept_Name,cost_name,OVERHEAD_FORMULA,OVERHEAD2_FORMULA,OVERHEAD3_FORMULA from data0034 where rkey='+tmp_value);
//        qryTmp.open;
//        if not qryTmp.IsEmpty then
//        begin
          edt_Cost_Dept_Code.Text :=frmPick_Item_Single.adsPick.fieldByName('Dept_Code').AsString;
          dmCon.adsMaster.FieldByName('OVERHEAD_FORMULA').Asstring := frmPick_Item_Single.adsPick.fieldByName('OVERHEAD_FORMULA').AsString;
          dmCon.adsMaster.FieldByName('OVERHEAD2_FORMULA').Asstring := frmPick_Item_Single.adsPick.fieldByName('OVERHEAD2_FORMULA').AsString;
          dmCon.adsMaster.FieldByName('OVERHEAD3_FORMULA').Asstring := frmPick_Item_Single.adsPick.fieldByName('OVERHEAD3_FORMULA').AsString;
          if  Trim(frmPick_Item_Single.adsPick.fieldByName('cost_name').AsString)='' then
           adsMaster.FieldByName('cost_name').Asstring := frmPick_Item_Single.adsPick.fieldByName('Dept_Name').AsString
          else
           adsMaster.FieldByName('cost_name').Asstring := frmPick_Item_Single.adsPick.fieldByName('cost_name').AsString;
         DBEdit5Enter(nil);
//        end;
        CopyInfo(tmp_value);
      end;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmSubEdit.SpeedButton2Click(Sender: TObject);
var
  Tmpstr:string;
begin
  with TForm_Acct.Create(self) do
  try
    Edit1.Text := edtAcctNo.Text;
    if ShowModal = mrok then
    begin
      dmcon.adsMaster.Edit;
      dmcon.adsMaster.FieldByName('GL_ACCT_PTR').Asstring := ADOQuery1.fieldByName('RKEY').AsString;
      edtAcctNo.Text := ADOQuery1.fieldByName('GL_ACC_NUMBER').AsString;
      labelAcctName.Caption :=ADOQuery1.fieldByName('GL_DESCRIPTION').AsString + ADOQuery1.fieldByName('description_2').AsString;
    end;
  finally
    free;
  end;
end;

procedure TfrmSubEdit.SetAllRKeyExpr;
var
  aqQuery:TAdoQuery;
  sqlstr:string;
begin
  aqQuery:= TAdoQuery.Create(nil);
  try
    aqQuery.Connection := dmCon.adsMaster.Connection;

    //显示部门
    if dmCon.adsMaster.FieldByName('Big_dept_ptr').AsString<>'' then
    begin
      aqQuery.SQL.Clear;
      aqQuery.Sql.Add('select Dept_Code,Dept_Name from data0034 where rkey='+dmCon.adsMaster.FieldByName('Big_dept_ptr').AsString);
      aqQuery.open;
      if not aqQuery.IsEmpty then
      begin
        edtDeptCode.Text :=aqQuery.fieldByName('Dept_Code').AsString+'/'+aqQuery.fieldByName('Dept_Name').AsString;
      end;
    end;
    //显示成本中心
    if dmCon.adsMaster.FieldByName('Cost_Dept_ptr').AsString<>'' then
    begin
      aqQuery.close;
      aqQuery.SQL.Clear;
      aqQuery.Sql.Add('select Dept_Code from data0034 where rkey='+dmCon.adsMaster.FieldByName('Cost_Dept_ptr').AsString);
      aqQuery.open;
      if not aqQuery.IsEmpty then
      begin
        edt_Cost_Dept_Code.Text :=aqQuery.fieldByName('Dept_Code').AsString;
      end;
    end;
    //显示会计科目\
    if dmCon.adsMaster.FieldByName('GL_ACCT_PTR').AsString<>'' then
    begin
      sqlstr:= ' SELECT dbo.Data0103.RKEY,Data0103.GL_ACC_NUMBER, IsNull(Data0103_2.GL_DESCRIPTION,'''') + ISNULL(Data0103_1.GL_DESCRIPTION, '''')'+
               ' + ''-''+ Data0103.GL_DESCRIPTION AS description_2 FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN dbo.Data0103 Data0103_1 ON '+
               ' Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR '+
               ' WHERE (dbo.Data0103.HAS_CHILD = 0) and Data0103.rKey= '+dmCon.adsMaster.FieldByName('GL_ACCT_PTR').AsString;
      aqQuery.close;
      aqQuery.SQL.Clear;
      aqQuery.Sql.Add(sqlstr);
      aqQuery.open;
      if not aqQuery.IsEmpty then
      begin
        edtAcctNo.Text :=aqQuery.fieldByName('GL_ACC_NUMBER').AsString;
        labelAcctName.Caption :=aqQuery.fieldByName('description_2').AsString;
      end;
    end;
  finally
    aqQuery.close;
    aqQuery.free;
  end;
end;

procedure TfrmSubEdit.btnCancelClick(Sender: TObject);
begin
  try
    with dmCon do begin
      adsSecondaryMatrl.CancelBatch(arAll);
      adsMainMatrl.CancelBatch(arAll);
      adsMaster.CancelBatch(arAll);
    end;
  except
  end;
end;

procedure TfrmSubEdit.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled := EnterMode<> em_browse;
  N2.Enabled := N1.Enabled;
end;

procedure TfrmSubEdit.N1Click(Sender: TObject);
var
  tmp:string;
begin
  tmp:= Pick_Part_Group(0,dmcon.adsMainMatrl.Connection,1);
  if tmp = '' then exit;
  with dmcon do begin
    aqIESParamsList.Close;
    aqIESParamsList.Parameters[0].Value := StrToInt(tmp);
    aqIESParamsList.Open;
    if aqIESParamsList.IsEmpty then
    begin
      ShowMsg('该类别的材料还没有设置IES参数，请先设置IES参数！','提示',1);
      aqIESParamsList.Close;
      abort;
    end;
    adsMainMatrl.append;
    adsMainMatrl.fieldbyname('inv_group_ptr').AsInteger:= StrToInt(tmp);
    adsMainMatrl.fieldbyname('dept_ptr').AsInteger:= adsMaster.FieldByName('rkey').asinteger;
    adsMainMatrl.fieldbyname('BOM_NAME').Asstring:= 'PART #';
//    adsMainMatrl.FieldByName('Seq_No').AsInteger := Max_SeqNO+1;
//    adsMainMatrl.post;
{    while not aqIESParamsList.Eof do begin
       adsBOMParams.Append ;
       adsBOMParams.Fieldbyname('parameter_ptr').Asstring:=aqIESParamsList.fieldbyname('parameter_ptr').asstring;
       adsBOMParams.Fieldbyname('tvalue').Asstring:=trim(aqIESParamsList.fieldbyname('def_value').asstring);
       adsBOMParams.Fieldbyname('seq_no').Asinteger:=aqIESParamsList.fieldbyname('seq_no').asinteger;
       adsBOMParams.Fieldbyname('TType').Asinteger:=4;
       adsBOMParams.Post;
       aqIESParamsList.next;
    end;}
  end;
end;

procedure TfrmSubEdit.N2Click(Sender: TObject);
begin
  dmCon.adsMainMatrl.Delete; 
end;

procedure TfrmSubEdit.ComboBox1Select(Sender: TObject);
var
  sp1,sp2,tmp:string;
  i,j:integer;
begin
  if enterMode=em_browse then exit;
  Memo1.DataSource.DataSet.Edit;
    sp1:=' ';
    sp2:=' ';
    i:=Memo1.SelStart ;
    j:=Memo1.CaretPos.y;
    if copy(Memo1.Text,i,1)=' ' then sp1:='';
    if copy(Memo1.Text,i+1,1)=' ' then sp2:='';
    memo1.Lines[j]:=copy(memo1.Lines[j],1,i)+sp1+trim( (Sender As TCombobox).Text)+sp2+copy(memo1.Lines[j],i+1,length(memo1.Lines[j])-i);
    Memo1.SelStart:=i+length(sp1)+length(trim((Sender As TCombobox).Text))+length(sp2);
    Memo1.SelLength:=3;
    Memo1.SetFocus ;
end;

procedure TfrmSubEdit.SpeedButton3Click(Sender: TObject);
var
  sp1,sp2:string;
  i,j:integer;
  symbol_txt:string;
begin
  if enterMode=em_browse then exit;
  Memo1.DataSource.DataSet.Edit;
  symbol_txt:=(Sender as TSpeedButton).Caption;
  if symbol_txt = 'IF' then
    symbol_txt := 'IF( , , )';
    sp1:=' ';
    sp2:=' ';
    i:=Memo1.SelStart ;
    j:=Memo1.CaretPos.y;
    if copy(Memo1.Text,i,1)=' ' then sp1:='';
    if copy(Memo1.Text,i+1,1)=' ' then sp2:='';
    memo1.Lines[j]:=copy(memo1.Lines[j],1,i)+sp1+trim(symbol_txt)+sp2+copy(memo1.Lines[j],i+1,length(memo1.Lines[j])-i);
    Memo1.SelStart:=i+1+length(sp1)+pos('(',trim(symbol_txt));
    Memo1.SelLength:=3;
    Memo1.SetFocus ;
end;

procedure TfrmSubEdit.SpeedButton15Click(Sender: TObject);
var
  tmp_value:string;
  sp1,sp2:string;
  i,j:integer;
begin
  if enterMode=em_browse then exit;
  tmp_value:= Pick_Pub_Eng_Param('',dmcon.ADOConnection1 ,2);
  if tmp_value <> '' then
  begin
    Memo1.DataSource.DataSet.Edit;
    sp1:=' ';
    sp2:=' ';
    i:=Memo1.SelStart ;
    j:=Memo1.CaretPos.y;
    if copy(Memo1.Text,i,1)=' ' then sp1:='';
    if copy(Memo1.Text,i+1,1)=' ' then sp2:='';
    memo1.Lines[j]:=copy(memo1.Lines[j],1,i)+sp1+trim(tmp_value)+sp2+copy(memo1.Lines[j],i+1,length(memo1.Lines[j])-i);
    Memo1.SelStart:=i+length(sp1)+length(trim(tmp_value))+length(sp2);
    Memo1.SetFocus ;
  end;
end;

procedure TfrmSubEdit.SpeedButton13Click(Sender: TObject);
begin
  if enterMode=em_browse then exit;
  Memo1.DataSource.DataSet.Edit;
  Memo1.clear
end;

procedure TfrmSubEdit.N3Click(Sender: TObject);  //二级材料
var
  tmp_value:string;
begin
  tmp_value:= Pick_Part('',dmcon.ADOConnection1 ,1);
  if tmp_value = '' then exit;
  if dmcon.adsSecondaryMatrl.Locate('INVENT_PTR',tmp_value,[]) then
  begin
    ShowMsg('材料重复,请重新选择','提示',1);
    abort;
  end;
  dmcon.adsSecondaryMatrl.Append;
  dmcon.adsSecondaryMatrl.Fieldbyname('invent_ptr').asstring:=tmp_Value;
end;

procedure TfrmSubEdit.PopupMenu2Popup(Sender: TObject);
begin
  N3.Enabled := EnterMode<> em_browse;
  N4.Enabled := N3.Enabled;
end;

procedure TfrmSubEdit.btnSaveClick(Sender: TObject);
begin
  dmcon.saveData;
  close;
end;

procedure TfrmSubEdit.SpeedButton14Click(Sender: TObject);
var strExpr:string;
tmp:string;
begin
  tmp:='';
  strExpr:= Memo1.Text;
  if Part_Cost_Formula_Verify(dmcon.adsMainMatrl.fieldbyName('Dept_ptr').AsInteger,dmcon.adsMainMatrl.fieldbyName('Inv_Group_ptr').AsInteger, strExpr,dmcon.ADOConnection1,tmp) then
    ShowMsg('验证通过','提示',1);
end;

procedure TfrmSubEdit.N4Click(Sender: TObject);
begin
  dmcon.adsSecondaryMatrl.delete;
end;

procedure TfrmSubEdit.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{  if (ssCtrl in Shift) and (Key = VK_DELETE) then
    abort;}
  if Key = VK_Insert then
    abort;
  if Key=VK_DOWN then
  begin
    Key:=0;
    TDBGridEH(Sender).DataSource.DataSet.Next
  end
end;

procedure TfrmSubEdit.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Insert then
    abort;
  if Key=VK_DOWN then
  begin
    Key:=0;
    TDBGrid(Sender).DataSource.DataSet.Next
  end
end;

procedure TfrmSubEdit.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if (length((Sender As TDBEdit).Text)=20) and (key<>chr(8)) then Abort;
  if (pos('.',(Sender As TDBEdit).Text)>0) and (key='.') then abort;
  if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
    Abort;
//  if (pos('-',DBEdit3.Text)>0) and (key='-') then abort;
  if (key='-') then abort;
end;

procedure TfrmSubEdit.DBEdit5Enter(Sender: TObject);
begin                         //只有成本中心自己为自己的时候允许修改名称
if dmCon.adsMaster.FieldByName('Cost_Dept_ptr').AsInteger=
   dmCon.adsMaster.FieldByName('rkey').AsInteger  then
   DBEdit5.ReadOnly:=False
else
   DBEdit5.ReadOnly:=True;
end;

procedure TfrmSubEdit.CopyInfo(tmp_value: string);
var i:Integer;
//str:string;
begin
  with dmCon.qryTmp do
  begin
    Close;
    SQL.Clear;
    Sql.Add('select t495.DEPT_PTR,t495.INVENT_PTR,t495.QTY_BOM_PER_SQFT ,t495.SEQ_NO ');
    Sql.Add('from data0495 t495 where t495.DEPT_PTR='+tmp_value+'  ');
    Open;
    First;
  end;
//  ShowMessage(IntToStr(dmCon.adsSecondaryMatrl.RecordCount));
  if dmCon.adsSecondaryMatrl.RecordCount>0 then
  begin
    if Application.MessageBox('二类原材料已存在，是否删除并重新加载？', '', MB_YESNO +
      MB_ICONWARNING) = IDYES then
    begin
      while dmCon.adsSecondaryMatrl.RecordCount>0 do dmCon.adsSecondaryMatrl.delete;
    end;
  end;
  for i:= 0 to dmCon.qryTmp.RecordCount-1 do
  begin
    dmCon.adsSecondaryMatrl.Append;
    dmCon.adsSecondaryMatrl.Fieldbyname('invent_ptr').AsInteger:=dmCon.qryTmp.FieldByName('INVENT_PTR').AsInteger;
   // str:= dmCon.qryTmp.Fields[2].AsString;
    dmCon.adsSecondaryMatrl.FieldByName('QTY_BOM_PER_SQFT').value:=dmCon.qryTmp.FieldByName('QTY_BOM_PER_SQFT').value;
   
    dmCon.adsSecondaryMatrl.FieldByName('SEQ_NO').AsInteger:=dmCon.qryTmp.FieldByName('SEQ_NO').AsInteger;
    dmCon.adsSecondaryMatrl.Post;
    if not dmCon.qryTmp.Eof then dmCon.qryTmp.Next;
  end;
//  with dmCon.qryTmp do   //复制制造费用
//  begin
//    Close;
//    SQL.Clear;
//    Sql.Add('select OVERHEAD_FORMULA,OVERHEAD2_FORMULA,OVERHEAD3_FORMULA from data0034 where rkey='+tmp_value);
//    Open;
//    First;
//  end;
//  if not (dmCon.adsMaster.State in[dsInsert, dsEdit]) then dmCon.adsMaster.Edit;
//  dmCon.adsMaster.FieldByName('OVERHEAD_FORMULA').Asstring := dmCon.qryTmp.fieldByName('OVERHEAD_FORMULA').AsString;
//  dmCon.adsMaster.FieldByName('OVERHEAD2_FORMULA').Asstring := dmCon.qryTmp.fieldByName('OVERHEAD2_FORMULA').AsString;
//  dmCon.adsMaster.FieldByName('OVERHEAD3_FORMULA').Asstring := dmCon.qryTmp.fieldByName('OVERHEAD3_FORMULA').AsString;
end;

procedure TfrmSubEdit.N5Click(Sender: TObject);
var
  tmp_Value:string;
begin
  tmp_value:= Pick_Cost_Dept('',dmcon.ADOConnection1,1);
  if tmp_value = '' then exit;
  CopyInfo(tmp_value);
end;

procedure TfrmSubEdit.N6Click(Sender: TObject);
begin
  //2018-5-4增加二类原材料导出
  if not dmCon.adsSecondaryMatrl.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    ShowMessage(Self.Caption);
    Export_dbGrid_to_Excel(Self.DBGrid1,'成品核算二类原材料');
  end;
end;

end.
