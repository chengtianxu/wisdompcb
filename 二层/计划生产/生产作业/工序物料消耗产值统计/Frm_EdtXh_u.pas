unit Frm_EdtXh_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Mask, ComCtrls,
  DB, ADODB, DBCtrls, Menus, ActnList;

type
  TFrm_EdtXh = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    BtnSave: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    EdtDept: TEdit;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    EdtFor: TEdit;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label6: TLabel;
    DateTimePicker2: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    EdtSumVal: TEdit;
    Edit4: TEdit;
    Label8: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Edit6: TEdit;
    Label10: TLabel;
    Label14: TLabel;
    PartEdt: TEdit;
    SpeedButton3: TSpeedButton;
    Label15: TLabel;
    EdtMem: TEdit;
    BtRead: TBitBtn;
    GroupBox2: TGroupBox;
    BtCal: TBitBtn;
    StringGrid1: TStringGrid;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    PopupMenu2: TPopupMenu;
    M1: TMenuItem;
    M11: TMenuItem;
    BtExl: TBitBtn;
    Label2: TLabel;
    Label21: TLabel;
    Label11: TLabel;
    Edit7: TEdit;
    Label12: TLabel;
    Edit8: TEdit;
    Label13: TLabel;
    Edit9: TEdit;
    Label22: TLabel;
    Edit1: TEdit;
    Shape1: TShape;
    M3: TMenuItem;
    N5: TMenuItem;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    BtUpdate: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    PopupMenu3: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    M22: TMenuItem;
    Label16: TLabel;
    Edit2: TEdit;
    M2: TMenuItem;
    BitBtn6: TBitBtn;
    Label17: TLabel;
    DBNavigator1: TDBNavigator;
    ActionList1: TActionList;
    ActPiror: TAction;
    ActNext: TAction;
    LbUnit1: TLabel;
    LbUnit2: TLabel;
    LbUnit3: TLabel;
    LbUnit4: TLabel;
    M33: TMenuItem;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    Label18: TLabel;
    Edit12: TEdit;
    Label19: TLabel;
    Edit10: TEdit;
    Label20: TLabel;
    Edit11: TEdit;
    Splitter1: TSplitter;
    procedure BitBtn9Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure BtExlClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtCalClick(Sender: TObject);
    procedure EdtDeptEnter(Sender: TObject);
    procedure PartEdtEnter(Sender: TObject);
    procedure EdtForEnter(Sender: TObject);
    procedure EdtDeptExit(Sender: TObject);
    procedure PartEdtExit(Sender: TObject);
    procedure EdtForExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure M1Click(Sender: TObject);
    procedure M3Click(Sender: TObject);
    procedure M11Click(Sender: TObject);
    procedure BtUpdateClick(Sender: TObject);
    procedure BtReadClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure M22Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit2Change(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit9KeyPress(Sender: TObject; var Key: Char);
    procedure ActPirorExecute(Sender: TObject);
    procedure ActNextExecute(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    Fdept,FPart,FFor:string;
    procedure DBEditVisble(Fformula:string);
  public
    Ftp:integer;
    procedure init;

  end;

var
  Frm_EdtXh: TFrm_EdtXh;

implementation
 uses DM_u,common,Pick_Item_Single,ConstVar,Frm_WFIn_u,Frm_GXCL_u,Frm_ParaUpdate_u,Frm_DlgRd_u;
{$R *.dfm}

{ TFrm_Edt }

procedure TFrm_EdtXh.init;
var i,iPl,iSt:integer;
begin
  if GetDeviceCaps(GetDC(self.Handle),HORZRES)>800 then
    Panel3.Width:=700;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  for i:=0 to DBGridEh1.Columns.Count-1 do DBGridEh1.Columns[i].ReadOnly:=i<>7;
  StringGrid1.Cells[0,0]:='序号';
  StringGrid1.Cells[1,0]:='参数名称';
  StringGrid1.Cells[2,0]:='单位';
  StringGrid1.Cells[3,0]:='参数值';
  for i:=1 to 10 do StringGrid1.Cells[0,i]:=' '+inttostr(i);
  if Ftp=0 then      //0 add,2 edit,3 check
  begin
    DM.GetNo(MaskEdit1,'39',0);
    DM.ADO571.Parameters[0].Value:=-1;
    DateTimePicker1.Date:=FCurrDate-1;
    DateTimePicker2.Date:=FCurrDate;
  end else if (Ftp=2) or (Ftp=3) then
  begin
    MaskEdit1.ReadOnly:=true;
    MaskEdit1.Text:=DM.ADO570number.Value;
    DM.ADO571.Parameters[0].Value:=DM.ADO570RKEY.Value;
    EdtDept.Text:=DM.ADO570dept_code.asstring;
    EdtDept.tag:=DM.ADO570rkey34.Value;
    Label2.Caption:=DM.ADO570dept_name.asstring;

    PartEdt.Text:=DM.ADO570INV_PART_NUMBER.asstring;
    PartEdt.tag:=DM.ADO570INVENTORY_PTR.Value;
    Label21.Caption:=DM.ADO570INV_name.asstring;

    GroupBox1.Caption:='实际消耗/理论消耗 ('+DM.ADO570inv_name.AsString+')';
    LbUnit1.Caption:=DM.ADO570unit_name.AsString;
    LbUnit2.Caption:=LbUnit1.Caption;
    LbUnit3.Caption:=LbUnit1.Caption;
    LbUnit4.Caption:=LbUnit1.Caption;

    EdtFor.Text:=DM.ADO570formula_number.AsString;
    DateTimePicker1.Date:=DM.ADO570start_date.Value;
    DateTimePicker2.Date:=DM.ADO570end_date.Value;
    DateTimePicker3.Time:=DM.ADO570start_date.Value;
    DateTimePicker4.Time:=DM.ADO570end_date.Value;
    EdtSumVal.Text:=DM.ADO570theory_result.AsString;

    EdtMem.Text:=DM.ADO570master_remark.Value;

    Memo1.Text:=DM.ADO570theorycalc_meth.Value;
    Memo2.Text:=DM.ADO570measurecalc_meth1.Value;
    Memo3.Text:=DM.ADO570measurecalc_meth2.Value;
    Memo4.Text:=DM.ADO570measurecalc_meth3.Value;

    EdtSumVal.Text:=DM.ADO570.FieldByName('theory_result').AsString;
    Edit4.Text:=DM.ADO570.FieldByName('measure_result1').AsString;
    Edit5.Text:=DM.ADO570.FieldByName('measure_result2').AsString;
    Edit6.Text:=DM.ADO570.FieldByName('measure_result3').AsString;

    Edit7.Text:=DM.ADO570.FieldByName('open_quantity').AsString;  //期初
    Edit8.Text:=DM.ADO570.FieldByName('expend_quantity').AsString;  //本期领用
    Edit9.Text:=DM.ADO570.FieldByName('closed_quantity').AsString;  //期末
    Edit1.Text:=floattostr(strtofloat('0'+Edit7.Text)+strtofloat('0'+Edit8.Text)-strtofloat('0'+Edit9.Text));//实际消耗

    DM.tmp.Close;
    DM.tmp.SQL.Text:='select top 1 number from data0570 where rkey='+DM.ADO570Statistic_ptr.AsString;
    DM.tmp.Open;
    if  not DM.tmp.IsEmpty then
      Label17.Caption:=DM.tmp.Fieldbyname('number').AsString;
    if Ftp=3 then
    begin
      BtnSave.Enabled:=false;
      BtRead.Enabled:=false;
      BtUpdate.Enabled:=false;
      BtCal.Enabled:=false;
      Panel2.Enabled:=false;
      M1.Enabled:=false;
      DBGridEh1.ReadOnly:=true;
      M3.Enabled:=false;
    end;
  end ;

  DM.ADO571.Open;
  EdtFor.Enabled:=DM.ADO571.IsEmpty;
  SpeedButton2.Enabled:=EdtFor.Enabled;
  EdtDept.Enabled:=EdtFor.Enabled;
  SpeedButton1.Enabled:=EdtFor.Enabled;

  DateTimePicker1.Enabled:=DateTimePicker1.Enabled and EdtFor.Enabled;
  DateTimePicker3.Enabled:=DateTimePicker1.Enabled;

  DateTimePicker2.Enabled:=EdtFor.Enabled;
  DateTimePicker4.Enabled:=EdtFor.Enabled;
  BitBtn6.Enabled:=EdtFor.Enabled;

  DBEditVisble(EdtFor.Text);
  DBGridEh1TitleClick(PreColumn);
  ActPiror.ShortCut:=38;
  ActNext.ShortCut:=40;
  
  DM.GetTotal(i,iPl,iSt);
  Edit10.Text:=inttostr(i);
  Edit11.Text:=inttostr(iPl);
  Edit12.Text:=inttostr(iSt);
end;

procedure TFrm_EdtXh.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_EdtXh.PopupMenu2Popup(Sender: TObject);
begin
  M1.Enabled:=Ftp in [0,1,2];
  M2.Enabled:=M1.Enabled and not DBGridEh1.DataSource.DataSet.IsEmpty and (DM.ADO571customer_name.Value<>sCust);
  M3.Enabled:=M2.Enabled;

  M11.Enabled:=not DBGridEh1.DataSource.DataSet.IsEmpty;
  M22.Enabled:=M1.Enabled and not DBGridEh1.DataSource.DataSet.IsEmpty;
  M33.Enabled:=M22.Enabled;
end;

procedure TFrm_EdtXh.BtExlClick(Sender: TObject);
var sD1,sD2:string;
begin
  //sD1:=formatdatetime('YYYY-MM-DD',DateTimePicker1.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker3.Date);
 // sD2:=formatdatetime('YYYY-MM-DD',DateTimePicker2.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker4.Date);
  Export_dbGridEH_to_Excel(DBGridEh1,self.Caption);
end;

procedure TFrm_EdtXh.SpeedButton1Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'Dept_code/部门编号/100,dept_name/部门名称/150,xz/性质/100';
      InputVar.Sqlstr :='select rkey,dept_code,dept_name, ''工序'' as xz from data0034 where ttype=1';
      inputvar.KeyField:='Dept_code';
      inputvar.InPut_value:=EdtDept.Text;
    end;
    1:
    begin
      InputVar.Fields := 'formula_number/公式代码/100,dept_name/工序名称/150,xz/性质/100';
      if EdtDept.Text<>'' then
        InputVar.Sqlstr :='select d569.*,d34.dept_code,d34.dept_name,d34.rkey rkey34,''消耗统计'' as xz from data0569 d569 inner join '+
                        'data0034 d34 on d569.dept_ptr=d34.rkey where d569.ttype=0 and d34.dept_code='''+EdtDept.Text+''''
      else
        InputVar.Sqlstr :='select d569.*,d34.dept_code,d34.dept_name,d34.rkey rkey34,''消耗统计'' as xz from data0569 d569 inner join '+
                        'data0034 d34 on d569.dept_ptr=d34.rkey where d569.ttype=0';

      inputvar.KeyField:='Dept_code';
    end;
    2:
    begin
      InputVar.Fields :='INV_PART_NUMBER/物料编码/200,inv_name/物料名称/150,INV_PART_DESCRIPTION/物料规格/200,unit_name/库存单位/60' ;
      InputVar.Sqlstr :='select d17.rkey,d17.INV_PART_NUMBER,d17.inv_name,d17.INV_PART_DESCRIPTION,d2.unit_name '+
                        'from data0017 d17 inner join data0002 d2 on d17.stock_unit_ptr=d2.rkey order by d17.INV_PART_NUMBER';
      inputvar.KeyField:='INV_PART_NUMBER';
      inputvar.InPut_value:=PartEdt.Text;
    end;
    3:
    begin
      InputVar.Fields :='number/统计编号/100,start_date/开始日期/120,end_date/结束日期/120,closed_quantity/期末数量/100' ;
      InputVar.Sqlstr :='select rkey,number,start_date,end_date,closed_quantity from data0570 where ttype=0 and status=1 order by number';
      inputvar.KeyField:='';

    end;
  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         EdtDept.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_code']);
         label2.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
         EdtDept.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
       end;
     1:begin
         EdtFor.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['formula_number']);
         if EdtDept.Text='' then
         begin
           EdtDept.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_code']);
           label2.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['Dept_name']);
           EdtDept.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey34').AsInteger;
         end;
         Memo1.Text:=frmPick_Item_Single.adsPick.Fieldbyname('theorycalc_meth').AsString;
         Memo2.Text:=frmPick_Item_Single.adsPick.Fieldbyname('measurecalc_meth1').AsString;
         Memo3.Text:=frmPick_Item_Single.adsPick.Fieldbyname('measurecalc_meth2').AsString;
         Memo4.Text:=frmPick_Item_Single.adsPick.Fieldbyname('measurecalc_meth3').AsString;
         DBEditVisble(EdtFor.Text);
       end;
     2:begin
         PartEdt.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['INV_PART_NUMBER']);
         label21.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['INV_Name']);
         PartEdt.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;

         GroupBox1.Caption:='实际消耗/理论消耗 ('+frmPick_Item_Single.adsPick.Fieldbyname('inv_name').AsString+')';
         LbUnit1.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('unit_name').AsString;
         LbUnit2.Caption:=LbUnit1.Caption;
         LbUnit3.Caption:=LbUnit1.Caption;
         LbUnit4.Caption:=LbUnit1.Caption;
       end;
     3:begin
         DateTimePicker1.Date:=frmPick_Item_Single.adsPick.Fieldbyname('end_date').AsDateTime;
         DateTimePicker3.Time:=frmPick_Item_Single.adsPick.Fieldbyname('end_date').AsDateTime;
         Edit7.Text:=frmPick_Item_Single.adsPick.Fieldbyname('closed_quantity').AsString;
         DateTimePicker1.Tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
         DateTimePicker1.Enabled:=false;
         DateTimePicker3.Enabled:=false;
         Edit7.Enabled:=false;
         Label17.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('number').AsString;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;


end;

procedure TFrm_EdtXh.BtnSaveClick(Sender: TObject);
var sD1,sD2:string;
begin
  if EdtDept.Text='' then
  begin
    showmessage('请输入统计工序...');
    EdtDept.SetFocus;
    exit;
  end;
  if PartEdt.Text='' then
  begin
    showmessage('请输入统计物料编码...');
    PartEdt.SetFocus;
    exit;
  end;
  if EdtFor.Text='' then
  begin
    showmessage('请输入计算公式...');
    EdtFor.SetFocus;
    exit;
  end;
  sD1:=formatdatetime('YYYY/MM/DD',DateTimePicker1.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker3.Date);
  sD2:=formatdatetime('YYYY/MM/DD',DateTimePicker2.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker4.Date);
  if strtodatetime(sD1)>=strtodatetime(sD2) then
  begin
    showmessage('开始日期必须小于结束日期');
    DateTimePicker2.SetFocus;
    exit;
  end;

  DM.tmp.Close;
  DM.tmp.SQL.Text:='select getdate()';
  DM.tmp.Open;
  if Ftp=0 then //add
  begin
    DM.ADO570_1.Parameters[0].Value:=-1 ;
    DM.ADO570_1.Open;
    DM.ADO570_1.Append;
    DM.ADO570_1.FieldByName('statistic_ptr').AsInteger:=DateTimePicker1.Tag;
  end else  begin
    DM.ADO570_1.Parameters[0].Value:=DM.ADO570RKEY.Value;
    DM.ADO570_1.Open;
    DM.ADO570_1.Edit;
  end;

  DM.ADO570_1.FieldByName('ttype').AsInteger:=0;
  DM.ADO570_1.FieldByName('status').AsInteger:=0 ;
  DM.ADO570_1.FieldByName('Dept_ptr').AsInteger:=EdtDept.Tag;
  DM.ADO570_1.FieldByName('INVENTORY_PTR').AsInteger:=PartEdt.Tag;
  DM.ADO570_1.FieldByName('formula_number').AsString:=EdtFor.Text;
  DM.ADO570_1.FieldByName('start_date').AsString:=formatdatetime('YYYY/MM/DD',DateTimePicker1.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker3.Date);
  DM.ADO570_1.FieldByName('end_date').AsString  :=formatdatetime('YYYY/MM/DD',DateTimePicker2.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker4.Date);
  DM.ADO570_1.FieldByName('empl_ptr').AsString:=user_ptr;
  DM.ADO570_1.FieldByName('statistic_date').AsDateTime:=DM.tmp.Fields[0].AsDateTime;
  DM.ADO570_1.FieldByName('master_remark').AsString:=EdtMem.Text;
  DM.ADO570_1.FieldByName('theorycalc_meth').AsString:=Memo1.Text;
  DM.ADO570_1.FieldByName('measurecalc_meth1').AsString:=Memo2.Text;
  DM.ADO570_1.FieldByName('measurecalc_meth2').AsString:=Memo3.Text;
  DM.ADO570_1.FieldByName('measurecalc_meth3').AsString:=Memo4.Text;

  if EdtSumVal.Text<>'' then
    DM.ADO570_1.FieldByName('theory_result').AsString:=EdtSumVal.Text;
  if Edit4.Text<>'' then
    DM.ADO570_1.FieldByName('measure_result1').AsString:=Edit4.Text;
  if Edit5.Text<>'' then
    DM.ADO570_1.FieldByName('measure_result2').AsString:=Edit5.Text;
  if Edit6.Text<>'' then
    DM.ADO570_1.FieldByName('measure_result3').AsString:=Edit6.Text;
  if Edit7.Text<>'' then
    DM.ADO570_1.FieldByName('open_quantity').AsString:=Edit7.Text;  //期初
  if Edit8.Text<>'' then
    DM.ADO570_1.FieldByName('expend_quantity').AsString:=Edit8.Text;  //本期领用
  if Edit9.Text<>'' then
    DM.ADO570_1.FieldByName('closed_quantity').AsString:=Edit9.Text;  //期末

  DM.ADOCon.BeginTrans;
  try
    if (Ftp=0) and not DM.GetNo(MaskEdit1,'39',1) then  abort;
    DM.ADO570_1.FieldByName('NUMBER').AsString:=MaskEdit1.Text;
    DM.ADO570_1.Post;
    DM.ADO570_1.UpdateBatch(arAll);
    svFlag:=true;
    if DM.ADO571.State in [dsEdit,dsInsert] then DM.ADO571.Post;
    DM.ADO571.Filter:='';
    DM.ADO572.Filter:='';
    
    if Fistate<>2 then // 570 add
    begin
      DM.ADO571.DisableControls;
      DM.ADO571.First;
      while not DM.ADO571.Eof do
      begin
        DM.ADO571.Edit;
        DM.ADO571Statistic_ptr.Value:=DM.ADO570_1.Fieldbyname('rkey').AsInteger;
        DM.ADO571.Post;
        DM.ADO571.Next;
      end;
      DM.ADO571.EnableControls;

      if DM.ADO572.Active then
      begin
        DM.ADO572.First;
        while not DM.ADO572.Eof do
        begin
          DM.ADO572.Edit;
          DM.ADO572Statistic_ptr.Value:=DM.ADO570_1.Fieldbyname('rkey').AsInteger;
          DM.ADO572.Post;
          DM.ADO572.Next;
        end;
      end;
    end;

    DM.ADO571.UpdateBatch(arAll);
    if DM.ADO572.Active then DM.ADO572.UpdateBatch(arAll);
    DM.ADOCon.CommitTrans;
    rkey570:=DM.ADO570_1.Fieldbyname('rkey').AsInteger;
    svFlag:=false;
    modalresult:=mrok;
  except
    on E: Exception do
    begin
      DM.ADOCon.RollbackTrans ;
      svFlag:=false;
      MessageDlg('数据保存失败...'+#13+E.Message,mtError, [mbOk], 0);
    end;
  end;
end;

procedure TFrm_EdtXh.BtCalClick(Sender: TObject);
var vThr,vMax,vMin,vAvr,sThr,sMax,sMin,sAvr:double;
    sD1,sD2:string;
    rec:integer;
begin
  if EdtDept.Text='' then
  begin
    showmessage('请输入统计工序...');
    EdtDept.SetFocus;
    exit;
  end;
  if EdtFor.Text='' then
  begin
    showmessage('请输入计算公式...');
    EdtFor.SetFocus;
    exit;
  end;
  if PartEdt.Text='' then
  begin
    showmessage('请输入物料编码...');
    PartEdt.SetFocus;
    exit;
  end;
  sD1:=formatdatetime('YYYY/MM/DD',DateTimePicker1.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker3.Date);
  sD2:=formatdatetime('YYYY/MM/DD',DateTimePicker2.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker4.Date);
  if strtodatetime(sD1)>=strtodatetime(sD2) then
  begin
    showmessage('开始日期必须小于结束日期');
    exit;
  end;
  if (Edit7.Text='') or (Edit9.Text='') then
  begin
    showmessage('请先输入期初数量、期末数量再计算...');
    exit;
  end;

  screen.Cursor:=crSQLWait;
  Edit2.Text:='';
  DM.ADO571.Filter:='';
  svFlag:=true;
  DM.ADO571.DisableControls;
  if not DM.ADO571.IsEmpty then rec:=DM.ADO571recno_number.AsInteger;
  DM.ADO571.First;
  while not DM.ADO571.Eof do
  begin
    vThr:=DM.Calcu(Memo1.Text);
    vMax:=DM.Calcu(Memo2.Text);
    vMin:=DM.Calcu(Memo3.Text);
    vAvr:=DM.Calcu(Memo4.Text);
    sThr:=sThr+vThr;
    sMax:=sMax+vMax;
    sMin:=sMin+vMin;
    sAvr:=sAvr+vAvr;
    DM.ADO571.Edit;
    DM.ADO571theory_result.Value:=vThr;
    DM.ADO571measure_result1.Value:=vMax;
    DM.ADO571measure_result2.Value:=vMin;
    DM.ADO571measure_result3.Value:=vAvr;
    DM.ADO571.Post;
    DM.ADO571.Next;
  end;
  svFlag:=false;
  DM.ADO571.Locate('recno_number',rec,[]);
  DM.ADO571.EnableControls;

  EdtSumVal.Text:=floattostr(sThr);
  Edit4.Text:=floattostr(sMax);
  Edit5.Text:=floattostr(sMin);
  Edit6.Text:=floattostr(sAvr);

  sD1:=formatdatetime('YYYY/MM/DD',DateTimePicker1.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker3.Date);
  sD2:=formatdatetime('YYYY/MM/DD',DateTimePicker2.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker4.Date);
  DM.tmp.Close;
  DM.tmp.SQL.Text:='SELECT SUM(dbo.Data0207.QUANTITY) FROM dbo.Data0207 INNER JOIN '+
                   'dbo.Data0457 ON dbo.Data0207.GON_PTR = dbo.Data0457.RKEY '+
                   'WHERE dbo.Data0207.INVENTORY_PTR ='+inttostr(PartEdt.Tag)+
                   ' AND dbo.Data0457.dept_ptr ='+inttostr(EdtDept.Tag)+
                   ' AND dbo.Data0207.TDATE >'''+sD1+
                   ''' and dbo.Data0207.TDATE <='''+sD2+'''';
  DM.tmp.Open;
  Edit8.Text:=DM.tmp.Fields[0].AsString;
  Edit1.Text:=floattostr(strtofloat('0'+Edit7.Text)+strtofloat('0'+Edit8.Text)-strtofloat('0'+Edit9.Text));//实际消耗
  screen.Cursor:=crDefault;
end;

procedure TFrm_EdtXh.EdtDeptEnter(Sender: TObject);
begin
  Fdept:=EdtDept.Text;
end;

procedure TFrm_EdtXh.PartEdtEnter(Sender: TObject);
begin
  FPart:=PartEdt.Text;
end;

procedure TFrm_EdtXh.EdtForEnter(Sender: TObject);
begin
   FFor:=EdtFor.Text;
end;

procedure TFrm_EdtXh.EdtDeptExit(Sender: TObject);
begin
  if self.ActiveControl=BitBtn9 then exit;
  if EdtDept.Text='' then
    Label2.Caption:=''
  else if (Fdept<>EdtDept.Text) and (EdtDept.Text<>'') then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select rkey,dept_code,dept_name from data0034 where ttype=1 and dept_code='''+EdtDept.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      showmessage('工序代码错误...');
      EdtDept.SetFocus;
    end else begin
      EdtDept.Tag:=DM.tmp.Fields[0].AsInteger;
      Label2.Caption:=DM.tmp.Fields[2].AsString;
      EdtFor.Text:='';
    end;
  end;
end;

procedure TFrm_EdtXh.PartEdtExit(Sender: TObject);
begin
  if self.ActiveControl=BitBtn9 then exit;
  if PartEdt.Text='' then
    Label21.Caption:=''
  else if (FPart<>PartEdt.Text) and (PartEdt.Text<>'') then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select d17.rkey,d17.INV_PART_NUMBER,d17.inv_name,d17.INV_PART_DESCRIPTION,d2.unit_name '+
                     'from data0017 d17 inner join data0002 d2 on d17.stock_unit_ptr=d2.rkey where INV_PART_NUMBER='''+PartEdt.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
    begin
      showmessage('物料编码错误...');
      PartEdt.SetFocus;
    end else begin
      PartEdt.Tag:=DM.tmp.Fields[0].AsInteger;
      Label21.Caption:=DM.tmp.Fieldbyname('inv_name').AsString;

      GroupBox1.Caption:='实际消耗/理论消耗 ('+DM.tmp.Fieldbyname('inv_name').AsString+')';
      LbUnit1.Caption:=DM.tmp.Fieldbyname('unit_name').AsString;
      LbUnit2.Caption:=LbUnit1.Caption;
      LbUnit3.Caption:=LbUnit1.Caption;
      LbUnit4.Caption:=LbUnit1.Caption;
    end;
  end;
end;

procedure TFrm_EdtXh.EdtForExit(Sender: TObject);
begin
  if self.ActiveControl=BitBtn9 then exit;
  if (FFor<>EdtFor.Text) and (EdtFor.Text<>'') then
  begin
    DM.tmp.Close;
      if EdtDept.Text<>'' then
        DM.tmp.SQL.Text :='select d569.*,d34.dept_code,d34.dept_name,d34.rkey rkey34 from data0569 d569 inner join '+
                        'data0034 d34 on d569.dept_ptr=d34.rkey where d569.ttype=0 and d34.dept_code='''+EdtDept.Text+
                        ''' and d569.formula_number='''+EdtFor.Text+''''
      else
        DM.tmp.SQL.Text:='select d569.*,d34.dept_code,d34.dept_name,d34.rkey rkey34 from data0569 d569 inner join '+
                        'data0034 d34 on d569.dept_ptr=d34.rkey where d569.ttype=0 and d569.formula_number='''+EdtFor.Text+'''';
    DM.tmp.Open;

    if DM.tmp.IsEmpty then
    begin
      showmessage('公式代码错误...');
      EdtFor.SetFocus;
    end else begin
      EdtDept.Tag:=DM.tmp.Fieldbyname('rkey34').AsInteger;
      EdtDept.Text:=DM.tmp.Fieldbyname('dept_code').AsString;
      Label2.Caption:=DM.tmp.Fieldbyname('dept_name').AsString;
      Memo1.Text:=DM.tmp.Fieldbyname('theorycalc_meth').AsString;
      Memo2.Text:=DM.tmp.Fieldbyname('measurecalc_meth1').AsString;
      Memo3.Text:=DM.tmp.Fieldbyname('measurecalc_meth2').AsString;
      Memo4.Text:=DM.tmp.Fieldbyname('measurecalc_meth3').AsString;
      DBEditVisble(EdtFor.Text);
    end;
  end;
end;

procedure TFrm_EdtXh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_EdtXh.M1Click(Sender: TObject);
var i,iPl,iSt:integer;
begin
  if EdtDept.Text='' then
  begin
    showmessage('请输入统计工序...');
    exit;
  end;
  if EdtFor.Text='' then
  begin
    showmessage('请输入计算公式...');
    exit;
  end;
  if not DM.ADO569.Active then
  begin
    DM.ADO569.Parameters[0].Value:=EdtFor.Text;
    DM.ADO569.Open;
  end;
  Frm_WFIn:=TFrm_WFIn.Create(nil);
  try
    Frm_WFIn.Ftp:=Tcomponent(sender).Tag;
    if Tcomponent(sender).Tag=0 then
    begin
      isWF:=true;
      DM.ADO571.Append ;
      DM.ADO571PANEL_A_B.Value:='APNL';
    end else begin
      Frm_WFIn.RadioGroup1.ItemIndex:=DM.ADO571ttype.AsInteger;
      DM.ADO571.Edit;
    end;
    Frm_WFIn.ShowModal;
  finally
    Frm_WFIn.Free;
    isWF:=false;
  end;
  DM.GetTotal(i,iPl,iSt);
  Edit10.Text:=inttostr(i);
  Edit11.Text:=inttostr(iPl);
  Edit12.Text:=inttostr(iSt);
end;

procedure TFrm_EdtXh.M3Click(Sender: TObject);
begin
  if Ftp=2 then    //edit
  begin
    if not DM.ADO572.Active then
    begin
      DM.ADO572.Parameters[0].Value:=DM.ADO570.fieldbyname('rkey').AsInteger;
      DM.ADO572.Open;
    end;
    DM.ADO572.Filter:='recno_number='+DM.ADO571recno_number.AsString;
    DM.ADO572.First;
    while not DM.ADO572.Eof do DM.ADO572.Delete;
  end else if DM.ADO572.Active then   //add
  begin
    DM.ADO572.Filter:='recno_number='+DM.ADO571recno_number.AsString;
    DM.ADO572.First;
    while not DM.ADO572.Eof do DM.ADO572.Delete;
  end;

  Edit11.Text:=inttostr(strtoint(Edit11.Text)-DM.ADO571pan_qty.asinteger);
  Edit12.Text:=inttostr(strtoint(Edit12.Text)-DM.ADO571set_qty.asinteger);
  DM.ADO571.Delete;
  Edit10.Text:=inttostr(DM.ADO571.RecordCount);
end;

procedure TFrm_EdtXh.M11Click(Sender: TObject);
begin
  Frm_GXCL:=TFrm_GXCL.Create(nil);
  try
    Frm_GXCL.initd(EdtDept.Text,DM.ADO571MANU_PART_Number.Value,Ftp);
    Frm_GXCL.ShowModal;
  finally
    Frm_GXCL.Free;
  end;
end;

procedure TFrm_EdtXh.BtUpdateClick(Sender: TObject);
var i:integer;
begin
  if (EdtFor.Text<>'') and (EdtDept.Text<>'') then
    if TFrm_ParaUpdate.UpdatePara(EdtFor.Text,EdtDept.Text) then
    begin
      Memo1.Text:=DM.tmp.fieldbyname('theorycalc_meth').value;
      Memo2.Text:=DM.tmp.fieldbyname('measurecalc_meth1').value;
      Memo3.Text:=DM.tmp.fieldbyname('measurecalc_meth2').value;
      Memo4.Text:=DM.tmp.fieldbyname('measurecalc_meth3').value;
      DM.tmp.Close;
    end;
end;

procedure TFrm_EdtXh.BtReadClick(Sender: TObject);
var i,iPl,iSt:integer;
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_EdtXh.N1Click(Sender: TObject);
var sD1,sD2:string;
   i,iPl,iSt:integer;
begin
  if EdtDept.Text='' then
  begin
    showmessage('请输入统计工序...');
    exit;
  end;
  if EdtFor.Text='' then
  begin
    showmessage('请输入计算公式...');
    exit;
  end;

  sD1:=formatdatetime('YYYY/MM/DD',DateTimePicker1.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker3.Date);
  sD2:=formatdatetime('YYYY/MM/DD',DateTimePicker2.Date)+' '+formatdatetime('HH:MM:SS',DateTimePicker4.Date);

  if strtodatetime(sD1)>=strtodatetime(sD2) then
  begin
    showmessage('开始日期必须小于结束日期');
    exit;
  end;
  if not DM.ADO569.Active then
  begin
    DM.ADO569.Parameters[0].Value:=EdtFor.Text;
    DM.ADO569.Open;
  end;

  if MessageDlg('读取本厂过板数据,将删除本厂原已读取的数据,确定吗?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    screen.Cursor:=crSQLWait;
    DM.readData(sD1,sD2,TMenuitem(Sender).Tag,inttostr(EdtDept.Tag));
    DM.ADO571.First;
    screen.Cursor:=crDefault;
  end;

  EdtFor.Enabled:=DM.ADO571.IsEmpty;
  SpeedButton2.Enabled:=EdtFor.Enabled;
  EdtDept.Enabled:=EdtFor.Enabled;
  SpeedButton1.Enabled:=EdtFor.Enabled;

  DateTimePicker1.Enabled:=DateTimePicker1.Enabled and EdtFor.Enabled;
  DateTimePicker3.Enabled:=DateTimePicker1.Enabled;

  DateTimePicker2.Enabled:=EdtFor.Enabled;
  DateTimePicker4.Enabled:=EdtFor.Enabled;
  BitBtn6.Enabled:=EdtFor.Enabled;

  DM.GetTotal(i,iPl,iSt);
  Edit10.Text:=inttostr(i);
  Edit11.Text:=inttostr(iPl);
  Edit12.Text:=inttostr(iSt);
end;

procedure TFrm_EdtXh.N3Click(Sender: TObject);
begin
  DM.ADO571.Edit;
  TDBEdit(self.ActiveControl).Field.Value:=DM.getval(Tcomponent(Sender).Tag);
  DM.ADO571.Post;
end;

procedure TFrm_EdtXh.M22Click(Sender: TObject);
begin
  with TFrm_DlgRd.Create(nil) do
  try
    FfileType:=TComponent(Sender).tag;
    if FfileType=0 then caption:=caption+'(从EXL文件)' else caption:=caption+'(从RTF文件)';
    showmodal;
  finally
    free;
  end;
end;

procedure TFrm_EdtXh.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DM.ADO571.State in [dsEdit,dsInsert] then DM.ADO571.Post;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO571.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO571.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label16.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit2Change(Edit2);
  end ;

end;

procedure TFrm_EdtXh.Edit2Change(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit2.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit2.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit2.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;  
end;

procedure TFrm_EdtXh.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then
   abort;
end;

procedure TFrm_EdtXh.DBEdit9KeyPress(Sender: TObject; var Key: Char);
var v:double;
begin
  if DM.ADOPara.FieldByName('D_tp'+inttostr(TDBEdit(Sender).Tag)).AsInteger=1 then
  begin
    if (key='-') or (key='+') then abort;
    if (key<>#13) and (key<>#8) then
    try
      V:=strtofloat(TDBEdit(Sender).Text+Key);
    except
      abort;
    end;
  end;
end;

procedure TFrm_EdtXh.DBEditVisble(Fformula:string);
begin
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select * from data0569 where formula_number='''+Fformula+'''';
  DM.tmp.Open;
  DBEdit24.Visible:=not DM.tmp.fieldbyname('PARA_PTR_9').IsNull;
  DBEdit23.Visible:=not DM.tmp.fieldbyname('PARA_PTR_8').IsNull;
  DBEdit22.Visible:=not DM.tmp.fieldbyname('PARA_PTR_7').IsNull;
  DBEdit21.Visible:=not DM.tmp.fieldbyname('PARA_PTR_6').IsNull;
  DBEdit20.Visible:=not DM.tmp.fieldbyname('PARA_PTR_5').IsNull;
  DBEdit19.Visible:=not DM.tmp.fieldbyname('PARA_PTR_4').IsNull;
  DBEdit12.Visible:=not DM.tmp.fieldbyname('PARA_PTR_3').IsNull;
  DBEdit11.Visible:=not DM.tmp.fieldbyname('PARA_PTR_2').IsNull;
  DBEdit10.Visible:=not DM.tmp.fieldbyname('PARA_PTR_1').IsNull;
  DBEdit9.Visible:=not DM.tmp.fieldbyname('PARA_PTR_0').IsNull;
end;

procedure TFrm_EdtXh.ActPirorExecute(Sender: TObject);
begin
  DM.ADO571.Prior;
end;

procedure TFrm_EdtXh.ActNextExecute(Sender: TObject);
begin
  DM.ADO571.Next;
end;

end.
