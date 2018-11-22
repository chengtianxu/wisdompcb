unit EditUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGridEh, Mask, Menus,
  DBCtrls, ComCtrls, DBGrids,ADODB;

type
  TEditForm1 = class(TForm)
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Edit12: TEdit;
    BitBtn7: TBitBtn;
    Edit13: TEdit;
    BitBtn8: TBitBtn;
    GroupBox1: TGroupBox;
    Memo4: TMemo;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    GroupBox2: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    GroupBox3: TGroupBox;
    Memo3: TMemo;
    Edit14: TEdit;
    Edit15: TEdit;
    ComboBox2: TComboBox;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    DateTimePicker1: TDateTimePicker;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    GroupBox5: TGroupBox;
    DBGrid4: TDBGrid;
    OpenDialog1: TOpenDialog;
    PopupMenu2: TPopupMenu;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    DataSource2: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Edit13Exit(Sender: TObject);
    procedure Edit12Exit(Sender: TObject);
    procedure Edit15KeyPress(Sender: TObject; var Key: Char);
    procedure Edit16KeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure update_filename();
    procedure FormCreate(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
  private
    { Private declarations }
    vkey0058 :integer;
    vEditMode:integer;
    vrkey0039:integer;
    vrkey0006:integer;
    vqty_backlog,vpanels:integer;
    vreprkey0034:integer;
    vuser_ptrCaption:string;
    vstep :integer;
    vflow_no :integer;
    vsave2:integer;
    vrkey0034:integer;
    vqty_org_rej:integer;
    vrkey0118:integer;
    vrkey0010:integer;
    vrkey0025:integer;

    function Get_key0058: integer;
    procedure Set_EditMode(const Value: integer);
    procedure Set_key0058(const Value: integer);
    procedure Showcombobox1Text2(const value1,value2,value3:integer);
    procedure Set_user_ptrCaption(const Value: string);
    procedure Set_flow_no(const Value: integer);
    procedure Set_reprkey0034(const Value: integer);
    procedure Set_rkey0006(const Value: integer);
    procedure Set_rkey0034(const Value: integer);
    procedure Set_rkey0039(const Value: integer);
    procedure Set_step(const Value: integer);
    procedure Set_qty_org_rej(const Value: integer);
    procedure Set_rkey0118(const Value: integer);

    function ShowDATA0010_2(CONST VALUE:INTEGER;VAR VALUE1: TEdit;VAR VALUE2:TLabel):BOOLEAN;
    function ShowDATA0025_2(CONST VALUE:INTEGER;VAR VALUE1: TEdit;VAR VALUE2:TLabel):BOOLEAN;
  public
    { Public declarations }
     file_name:Tstringlist;
     property key0058:integer read Get_key0058 write Set_key0058;
     property EditMode:integer write Set_EditMode;
     property user_ptrCaption:string write Set_user_ptrCaption;

     property rkey0006:integer write Set_rkey0006;
     property rkey0039:integer write Set_rkey0039;
     property rkey0034:integer write Set_rkey0034;
     property reprkey0034:integer write Set_reprkey0034;
     property flow_no:integer write Set_flow_no;
     property step:integer write Set_step;
     property qty_org_rej:integer write Set_qty_org_rej;
     property rkey0118:integer write Set_rkey0118;
  end;

var
  EditForm1: TEditForm1;
const
 TmpFileDir = 'c:\tmp\';
implementation

uses
   DMUnit1
   ,ConstVar,shellAPI
   ,Pick_Item_Single
   ,PubFunc,common, BMListFrm;
   
{$R *.dfm}

{ TEditForm1 }



procedure TEditForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
      begin
          key:=#0;
          perform(wm_nextdlgctl,0,0);{移动到下一个控件}
      end;
end;

function TEditForm1.Get_key0058: integer;
begin
  result := vkey0058;
end;

procedure TEditForm1.Set_EditMode(const Value: integer);
begin
  vEditMode := value;
end;

procedure TEditForm1.Set_key0058(const Value: integer);
begin
  vkey0058 := value;

end;

procedure TEditForm1.BitBtn5Click(Sender: TObject);
var
  vstp :integer;
  valDateTime, valDate,valdt: string ;
  valymd:tdatetime;
begin

  if trim(Edit14.Text) = '' then
      begin
          messagedlg('投诉编号不能为空,请输入!',mtinformation,[mbOk],0);
          Edit14.Setfocus;
          exit;
      end;
  if trim(ComboBox2.Text) = '' then
      //if ComboBox2.Items.Count > 0 then
          begin
              messagedlg('请输入投诉级别!',mtinformation,[mbOk],0);
              ComboBox2.Setfocus;
              exit;
          end;

  if trim(Edit13.Text)='' then
      begin
          messagedlg('请输入客户!',mtinformation,[mbOk],0);
          Edit13.Setfocus;
          exit;
      end;
  if trim(Edit12.Text)='' then
      begin
          messagedlg('请输入本厂编号!',mtinformation,[mbOk],0);
          Edit12.Setfocus;
          exit;
      end;
   if trim(Edit1.Text) = '' then
      begin
          messagedlg('请选择一个数量单位!',mtinformation,[mbOk],0);
          BitBtn1.Setfocus;
          exit;
      end;
  if trim(Edit3.Text) = '' then
      begin
          messagedlg('请输入主要缺陷!',mtinformation,[mbOk],0);
          Edit3.Setfocus;
          exit;
      end;
  if trim(Edit4.Text) = '' then
      begin
          messagedlg('请输入产品周期!',mtinformation,[mbOk],0);
          Edit4.Setfocus;
          exit;
      end;

  if trim(Edit15.Text) = '' then
      begin
          messagedlg('请输入数量!',mtinformation,[mbOk],0);
          Edit15.Setfocus;
          exit;
      end;
  if trim(Memo4.Text) = '' then
      begin
          messagedlg('请输入投诉内容!',mtinformation,[mbOk],0);
          Memo4.Setfocus;
          exit;
      end;


  dm.Get_ServerDatetime(valDateTime, valDate,valdt,valymd);
  if VEditMode = 0 then
      begin
          dm.ADOQ0101.Append ;
          dm.ADOQ0101CSI_USER_PTR.AsString := vuser_ptrCaption ;
          dm.ADOQ0101LOG_DATE.AsDateTime := valymd ;
      end
  else if VEditMode = 1 then
      begin
          dm.ADOQ0101.Edit;
          dm.ADOQ0101CLOSED_BY_PTR.AsString := vuser_ptrCaption ;
          dm.ADOQ0101CLOSED_DATE.AsDateTime := valymd ;
      end;




  dm.ADOQ0101LOG_NUMBER.AsString := edit14.Text;
  dm.ADOQ0101CUSTOMER_PART_PTR.AsInteger := vrkey0025 ;
       //   if not dm.ADOQ0101CUSTOMER_PART_PTR.IsNull then
       //       ShowDATA0025_2(,Edit13,Label20);

  dm.ADOQ0101CUSTOMER_PTR.AsInteger := vrkey0010 ;
       //   if not dm.ADOQ0101CUSTOMER_PTR.IsNull then
       //       ShowDATA0010_2(,Edit12,Label19);

  dm.ADOQ0101SHIP_DATE.AsDateTime := DateTimePicker1.Date ;
          //if not dm.ADOQ0101SHIP_DATE.IsNull then

  DM.ADOQ0101DEFECT_MAIN.Value:=Edit3.Text;
  dm.ADOQ0101CYCLES.Value:=Edit4.Text;
  DM.ADOQ0101UNIT_PTR.Value:=Edit1.Tag;
  dm.ADOQ0101QTY.AsString := Edit15.Text;
  dm.ADOQ0101EFFECT_TP.AsString := ComboBox2.Text;
  //dm.ADOQ0101LOSS_AMT.AsString := Edit16.Text;
          //if not dm.ADOQ0101LOSS_AMT.IsNull then
  dm.ADOQ0101analysis.AsString := memo1.Text;
  dm.ADOQ0101after_action.AsString := memo2.Text;
  dm.ADOQ0101result.AsString := memo3.Text;
  dm.ADOQ0101content.AsString := memo4.Text;

  dm.ADOConnection1.BeginTrans ;
  try
      dm.ADOQ0101.UpdateBatch();
      dm.ADOQ0118.First ;
      while not dm.ADOQ0118.Eof do
          begin
               if dm.ADOQ0118SOURCE_PTR.IsNull then
                   begin
                       dm.ADOQ0118.Edit ;
                       dm.ADOQ0118SOURCE_PTR.AsInteger := dm.ADOQ0101rkey.AsInteger ;
                   end ;
               dm.ADOQ0118.Next ;
          end ;
      dm.ADOQ0118.UpdateBatch();
      Self.update_filename;
      if VEditMode = 0 then
          begin
              if dm.TemADOQuery.Active then dm.TemADOQuery.Close ;
              dm.TemADOQuery.SQL.Clear ;
              dm.TemADOQuery.SQL.Add('update data0004 set seed_value = ''' + trim(edit14.Text) + ''' WHERE data0004.rkey = 2 ');
              dm.TemADOQuery.Prepared ;
              dm.TemADOQuery.ExecSQL  ;
          end;
      dm.ADOConnection1.CommitTrans ;
      modalresult := mrok ;
  except
      on E: Exception do
          begin
              dm.ADOConnection1.RollbackTrans ;
              MessageDlg(E.Message,mtError, [mbOk], 0);
          end;
  end;

  

  {
  if VEditMode = 0 then
      begin
          if dm.adoq0058.Active then dm.adoq0058.Close ;
          dm.adoq0058.Parameters.ParamValues['rkey0058'] := null;
          dm.adoq0058.Prepared ;
          dm.adoq0058.Open ;
          dm.adoq0058.Append ;
      end
  else if VEditMode = 1 then
      begin
          dm.adoq0058.Edit ;
      end;

  dm.adoq0058wo_ptr.asinteger := vrkey0006;
  dm.adoq0058tran_ptr.asinteger := 0 ;
  dm.adoq0058mrb_no.asstring := Edit1.text;
  dm.adoq0058reject_ptr.AsInteger := vrkey0039;


  dm.ADOQ564834.Locate('step_no',strtoint(copy(ComboBox1.Text,1,3)),[]);
  dm.adoq0058dept_ptr.asinteger := dm.ADOQ564834.fieldbyname('d0034_rkey').asinteger;
  dm.adoq0058flow_no.asinteger := vflow_no;
  dm.adoq0058step.asinteger := strtoint(copy(ComboBox1.Text,1,3));//vstep;
  dm.adoq0058resp_dept_ptr.AsInteger := vreprkey0034;
  dm.adoq0058qty_reject.AsInteger := 0;//edit4.Text ;//是否要扣数,不扣数用0表示
  dm.adoq0058qty_org_rej.AsInteger := strtointdef(edit4.Text,0) ; //申请数量
  dm.adoq0058panels.AsInteger := strtointdef(edit8.Text,0) ;
  dm.adoq0058tdatetime.asdatetime := valymd;
  dm.adoq0058empl_ptr.asstring := vuser_ptrCaption;
  dm.adoq0058StepNow.AsInteger := vstep;

  if dm.ADOQ0006.Active then dm.ADOQ0006.Close;
  dm.ADOQ0006.Parameters.ParamValues['rkey0006'] := vrkey0006;
  dm.ADOQ0006.Prepared ;
  dm.ADOQ0006.Open ;
  dm.ADOQ0006.Edit ;
  dm.ADOQ0006QUAN_ALLREJ.AsInteger := dm.ADOQ0006QUAN_ALLREJ.AsInteger - vqty_org_rej + strtointdef(edit4.Text,0) ;


  try
      dm.ADOConnection1.BeginTrans;
      dm.adoq0058.UpdateBatch();
      dm.ADOQ0006.UpdateBatch();
      dm.ADOConnection1.CommitTrans ;
      if VEditMode = 1 then
          modalresult := mrok ;
      vsave2 := vsave2 + 1;
      edit3.Text := '';
      Label4.Caption := '';
      Edit4.Text := '';
      Edit8.Text := '';
      Edit6.Text := '';
      Label8.Caption := '';
      Edit2.SetFocus ;

  except
      on E: Exception do
          begin
              dm.ADOConnection1.RollbackTrans ;
              MessageDlg(E.Message,mtError, [mbOk], 0);
          end;
  end;

{}







end;

procedure TEditForm1.FormShow(Sender: TObject);
var
  valDateTime, valDate,valdt: string ;
  valymd:tdatetime ;
begin
  vsave2 := 0 ;
  if vEditMode = 0 then
      begin
          if dm.TemADOQuery.Active then dm.TemADOQuery.Close ;
          dm.TemADOQuery.SQL.Clear ;
          dm.TemADOQuery.SQL.Add('SELECT seed_value from data0004 WHERE data0004.rkey = 2 ');
          dm.TemADOQuery.Prepared ;
          dm.TemADOQuery.Open ;
          edit14.Text := dm.Get_Data0004 ;
          dm.TemADOQuery.Close ;

          dm.Get_ServerDatetime(valDateTime, valDate,valdt,valymd) ;
          DateTimePicker1.Date  := strtodate(valDate) ;
      end
  else
      begin
          edit14.Text := dm.ADOQ0101LOG_NUMBER.AsString ;
          Edit3.Text := DM.ADOQ0101DEFECT_MAIN.AsString;
          Edit4.Text := DM.ADOQ0101CYCLES.AsString;
          if not dm.ADOQ0101CUSTOMER_PART_PTR.IsNull then
              begin
                  vrkey0025 := dm.ADOQ0101CUSTOMER_PART_PTR.AsInteger ;
                  ShowDATA0025_2(dm.ADOQ0101CUSTOMER_PART_PTR.AsInteger,Edit12,Label19);
              end;
          if not dm.ADOQ0101CUSTOMER_PTR.IsNull then
              begin
                  vrkey0010 := dm.ADOQ0101CUSTOMER_PTR.AsInteger ;
                  ShowDATA0010_2(dm.ADOQ0101CUSTOMER_PTR.AsInteger,Edit13,Label20);
              end ;
          if not dm.ADOQ0101SHIP_DATE.IsNull then
              DateTimePicker1.Date := dm.ADOQ0101SHIP_DATE.AsDateTime ;
          if not dm.ADOQ0101UNIT_PTR.IsNull then
          begin
            with DM.TemADOQuery1 do
            begin
              Close;
              sql.Clear;
              SQL.Add('select * from data0002 where rkey='+dm.ADOQ0101UNIT_PTR.AsString);
              Open;
            end;
            Edit1.Text:=dm.TemADOQuery1.FieldValues['unit_name'];
            Edit1.Tag:=dm.ADOQ0101UNIT_PTR.Value;
          end;
          Edit15.Text := dm.ADOQ0101QTY.AsString ;
          ComboBox2.Text := dm.ADOQ0101EFFECT_TP.AsString ;
//          if not dm.ADOQ0101LOSS_AMT.IsNull then
//              Edit16.Text := dm.ADOQ0101LOSS_AMT.AsString ;
          memo1.Text :=dm.ADOQ0101analysis.AsString ;
          memo2.Text :=dm.ADOQ0101after_action.AsString ;
          memo3.Text :=dm.ADOQ0101result.AsString ;
          memo4.Text :=dm.ADOQ0101content.AsString ;
      end ;
  if vEditMode = 2 then
      begin
          BitBtn1.Enabled :=False;
          BitBtn5.Enabled := false;
          Edit14.ReadOnly := true ;
          Edit13.ReadOnly := true ;
          Edit4.ReadOnly := true ;
          Edit3.ReadOnly := true ;
          BitBtn8.Enabled := false;
          Edit12.ReadOnly := true ;
          BitBtn7.Enabled := false;
          DateTimePicker1.Enabled := false ;
          Edit15.ReadOnly := true ;
          ComboBox2.Enabled := false;
          Memo4.ReadOnly := true ;
          Memo1.ReadOnly := true ;
          Memo2.ReadOnly := true ;
          Memo3.ReadOnly := true ;
          DBGridEh1.ReadOnly := true ;
          n1.Enabled := true;
          n2.Enabled := true ;

          //edit16.ReadOnly := true ;
      end ;

end;

procedure TEditForm1.Showcombobox1Text2(const value1, value2,
  value3: integer);
begin

end;

procedure TEditForm1.Set_user_ptrCaption(const Value: string);
begin
  vuser_ptrCaption := value;
end;

procedure TEditForm1.BitBtn6Click(Sender: TObject);
begin
  if vsave2 > 0 then
      modalresult := mrok
  else
      modalresult := mrCancel;
end;

procedure TEditForm1.Set_flow_no(const Value: integer);
begin
  vflow_no := value;
end;

procedure TEditForm1.Set_reprkey0034(const Value: integer);
begin
  vreprkey0034 := value;
  if dm.TemADOQuery.Active then dm.TemADOQuery.Close ;
  dm.TemADOQuery.SQL.Clear ;
  dm.TemADOQuery.SQL.Add('SELECT DEPT_CODE,DEPT_NAME from data0034 WHERE rkey = '+inttostr(vreprkey0034));
  dm.TemADOQuery.Prepared ;
  dm.TemADOQuery.Open ;
  //Edit6.Text := dm.TemADOQuery.fieldbyname('DEPT_CODE').AsString;
  //Label8.Caption := dm.TemADOQuery.fieldbyname('DEPT_NAME').AsString;
  dm.TemADOQuery.Close ;
end;

procedure TEditForm1.Set_rkey0006(const Value: integer);
begin
  vrkey0006 := value;
  if dm.TemADOQuery.Active then dm.TemADOQuery.Close ;
  dm.TemADOQuery.SQL.Clear ;
  dm.TemADOQuery.SQL.Add('  SELECT Data0006.WORK_ORDER_NUMBER, Data0056.PANELS,');
  dm.TemADOQuery.SQL.Add('    Data0056.QTY_BACKLOG - Data0006.QUAN_ALLREJ AS QTY_BACKLOG,');
  dm.TemADOQuery.SQL.Add('    Data0006.PARTS_PER_PANEL, Data0056.TO_BE_STOCKED,');
  dm.TemADOQuery.SQL.Add('    Data0056.STEP, Data0034.DEPT_CODE, Data0056.DEPT_PTR,');
  dm.TemADOQuery.SQL.Add('    Data0034.DEPT_PTR AS deptptr, Data0034.DEPT_NAME');
  dm.TemADOQuery.SQL.Add(' FROM Data0034 RIGHT OUTER JOIN');
  dm.TemADOQuery.SQL.Add('    Data0056 ON');
  dm.TemADOQuery.SQL.Add('    Data0034.RKEY = Data0056.DEPT_PTR RIGHT OUTER JOIN');
  dm.TemADOQuery.SQL.Add('    Data0006 ON Data0056.WO_PTR = Data0006.RKEY');
  dm.TemADOQuery.SQL.Add(' where data0006.rkey ='+inttostr(vrkey0006));
  dm.TemADOQuery.Prepared ;
  dm.TemADOQuery.Open ;
  //Edit2.Text := dm.TemADOQuery.fieldbyname('work_order_number').asstring;
  //Edit5.Text := dm.TemADOQuery.fieldbyname('qty_backlog').asstring;
  //Edit9.Text := dm.TemADOQuery.fieldbyname('panels').asstring;
  //Edit10.Text := dm.TemADOQuery.fieldbyname('parts_per_panel').asstring;
  //Edit7.Text := dm.TemADOQuery.fieldbyname('dept_code').asstring;
  vqty_backlog := dm.TemADOQuery.fieldbyname('qty_backlog').asinteger;
  vpanels := dm.TemADOQuery.fieldbyname('panels').asinteger;
  //Showcombobox1Text2(vrkey0006,vrkey0006,vstep);
  dm.TemADOQuery.Close ;

end;

procedure TEditForm1.Set_rkey0034(const Value: integer);
begin
  vrkey0034 := value;
end;

procedure TEditForm1.Set_rkey0039(const Value: integer);
begin
  vrkey0039 := value;
  if dm.TemADOQuery.Active then dm.TemADOQuery.Close ;
  dm.TemADOQuery.SQL.Clear ;
  dm.TemADOQuery.SQL.Add('SELECT REJ_CODE,REJECT_DESCRIPTION from data0039 WHERE rkey = '+inttostr(vrkey0039));
  dm.TemADOQuery.Prepared ;
  dm.TemADOQuery.Open ;
  //edit3.Text := dm.TemADOQuery.fieldbyname('REJ_CODE').AsString;
  //Label4.Caption := dm.TemADOQuery.fieldbyname('REJECT_DESCRIPTION').AsString;

  dm.TemADOQuery.Close ;
end;

procedure TEditForm1.Set_step(const Value: integer);
begin
  vstep := value;
end;

procedure TEditForm1.Set_qty_org_rej(const Value: integer);
begin
  vqty_org_rej := value;
end;

procedure TEditForm1.Set_rkey0118(const Value: integer);
begin
  vrkey0118 := value;
end;

procedure TEditForm1.BitBtn8Click(Sender: TObject);
var
  InputVar: PDlgInput ;
  s:string;
  frmPick_Item_Single2 :TfrmPick_Item_Single;
begin
   s := 'select RKEY,CUST_CODE,CUSTOMER_NAME from Data0010';

  frmPick_Item_Single2 := TfrmPick_Item_Single.Create(application) ;
  try
      //frmPick_Item_Single.Height := 600;
      //frmPick_Item_Single.Width := 800;
      InputVar.Fields := 'CUST_CODE/客户代码/200,CUSTOMER_NAME/客户名称/200';
      //InputVar.KeyField
      InputVar.Sqlstr := s ;
      //InputVar.InPut_value
      InputVar.AdoConn := DM.ADOConnection1 ;
      frmPick_Item_Single2.InitForm_New(InputVar)  ;
      if frmPick_Item_Single2.ShowModal = mrok then
          begin
              if frmPick_Item_Single2.adsPick.IsEmpty then exit;
              Edit13.Text := frmPick_Item_Single2.adsPick.fieldbyname('CUST_CODE').asstring;
              Label20.Caption := frmPick_Item_Single2.adsPick.fieldbyname('CUSTOMER_NAME').asstring;
              vrkey0010 := frmPick_Item_Single2.adsPick.fieldbyname('rkey').AsInteger ;
          end
      else
          Edit13.SetFocus ;
  finally
      frmPick_Item_Single2.adsPick.Close;
      frmPick_Item_Single2.Free ;
  end;

end;

procedure TEditForm1.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
  s:string;
  frmPick_Item_Single2 :TfrmPick_Item_Single;
begin
   s := 'select RKEY,MANU_PART_NUMBER,MANU_PART_DESC,CUSTOMER_PTR from data0025 where (PARENT_PTR = 0 or PARENT_PTR is null) ';
   if trim(edit13.Text) <> ''  then
       begin
           s := s +' and CUSTOMER_PTR = ' + inttostr(vrkey0010) ;
       end;

  frmPick_Item_Single2 := TfrmPick_Item_Single.Create(application) ;
  try
      //frmPick_Item_Single.Height := 600;
      //frmPick_Item_Single.Width := 800;
      InputVar.Fields := 'MANU_PART_NUMBER/本产编号/200,MANU_PART_DESC/客户型号/200';
      //InputVar.KeyField
      InputVar.Sqlstr := s ;
      //InputVar.InPut_value
      InputVar.AdoConn := DM.ADOConnection1 ;
      frmPick_Item_Single2.InitForm_New(InputVar)  ;
      if frmPick_Item_Single2.ShowModal = mrok then
          begin
              if frmPick_Item_Single2.adsPick.IsEmpty then exit;

              Edit12.Text := frmPick_Item_Single2.adsPick.fieldbyname('MANU_PART_NUMBER').asstring;
              Label19.Caption := frmPick_Item_Single2.adsPick.fieldbyname('MANU_PART_DESC').asstring;

              vrkey0025 := frmPick_Item_Single2.adsPick.fieldbyname('rkey').AsInteger ;
              if trim(edit13.Text) = ''  then
                  begin
                      vrkey0010 := frmPick_Item_Single2.adsPick.fieldbyname('CUSTOMER_PTR').AsInteger ;
                      //
                      ShowDATA0010_2(vrkey0010,Edit13,Label20);
                  end;
          end
      else
          Edit12.SetFocus ;
  finally
      frmPick_Item_Single2.adsPick.Close;
      frmPick_Item_Single2.Free ;
  end;

end;

procedure TEditForm1.Edit13Exit(Sender: TObject);
var
  s : string;
begin
  if self.Activecontrol=BitBtn8 then exit;
  if self.Activecontrol=BitBtn6 then exit;
  if trim(Edit13.Text) = '' then exit ;
  s := 'select RKEY,CUST_CODE,CUSTOMER_NAME from Data0010'
             +' where CUST_CODE =' + '''' + trim(edit13.Text) + '''';
  if dm.TemADOQuery.Active then dm.TemADOQuery.Close ;
  dm.TemADOQuery.SQL.Clear ;
  dm.TemADOQuery.SQL.Add(s);
  dm.TemADOQuery.Prepared ;
  dm.TemADOQuery.Open ;
  if dm.TemADOQuery.IsEmpty then
      begin
          messagedlg('客户代号错误！',mtinformation,[mbok],0);
          Edit13.SetFocus ;
      end
  else
      begin
          Edit13.Text := dm.TemADOQuery.fieldbyname('CUST_CODE').asstring;
          Label20.Caption := dm.TemADOQuery.fieldbyname('CUSTOMER_NAME').asstring;
          vrkey0010 := dm.TemADOQuery.fieldbyname('rkey').AsInteger ;
      end;
  dm.TemADOQuery.Close ;

end;

procedure TEditForm1.Edit12Exit(Sender: TObject);
var
  s : string;
begin
  if self.Activecontrol = BitBtn7 then exit;
  if self.Activecontrol = BitBtn6 then exit;
  if trim(Edit12.Text) = '' then exit ;
  s := 'select RKEY,MANU_PART_NUMBER,MANU_PART_DESC,CUSTOMER_PTR from data0025 where PARENT_PTR = 0 or PARENT_PTR is null'
             +' and MANU_PART_NUMBER =' + '''' + trim(Edit12.Text) + '''';
  if trim(edit13.Text) <>''  then
      begin
          s := s + ' and CUSTOMER_PTR = ' + inttostr(vrkey0010) ;
      end;
  if dm.TemADOQuery.Active then dm.TemADOQuery.Close ;
  dm.TemADOQuery.SQL.Clear ;
  dm.TemADOQuery.SQL.Add(s);
  dm.TemADOQuery.Prepared ;
  dm.TemADOQuery.Open ;
  if dm.TemADOQuery.IsEmpty then
      begin
          messagedlg('本厂编号错误！',mtinformation,[mbok],0);
          Edit12.SetFocus ;
      end
  else
      begin
          Edit12.Text := dm.TemADOQuery.fieldbyname('MANU_PART_NUMBER').asstring;
          Label19.Caption := dm.TemADOQuery.fieldbyname('MANU_PART_DESC').asstring;

          vrkey0025 := dm.TemADOQuery.fieldbyname('rkey').AsInteger ;
          if vrkey0010 <> dm.TemADOQuery.fieldbyname('CUSTOMER_PTR').AsInteger then
              begin
                  vrkey0010 := dm.TemADOQuery.fieldbyname('CUSTOMER_PTR').AsInteger ;
                  ShowDATA0010_2(vrkey0010,Edit13,Label20);
              end;
      end;
  dm.TemADOQuery.Close ;

end;

procedure TEditForm1.Edit15KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
      abort;
end;

procedure TEditForm1.Edit16KeyPress(Sender: TObject; var Key: Char);
begin
//  if not (key in ['0'..'9',#8,'.']) then
//      abort;
//  if key = '.' then
//      if pos('.',edit16.Text) > 0 then
//          abort;
end;

function TEditForm1.ShowDATA0010_2(const VALUE: INTEGER; var VALUE1: TEdit;
                                   var VALUE2: TLabel): BOOLEAN;
begin
  IF DM.TemADOQuery.Active THEN dm.TemADOQuery.Close;
  DM.TemADOQuery.SQL.Clear ;
  DM.TemADOQuery.SQL.Add('select RKEY,CUST_CODE,CUSTOMER_NAME from Data0010 where rkey = ' +inttostr(vrkey0010));
  DM.TemADOQuery.Prepared ;
  DM.TemADOQuery.Open ;
  if not DM.TemADOQuery.IsEmpty then
      begin
          VALUE1.Text := DM.TemADOQuery.FieldByName('CUST_CODE').AsString ;
          VALUE2.Caption := DM.TemADOQuery.FieldByName('CUSTOMER_NAME').AsString ;

      end ;
  DM.TemADOQuery.Close ;
end;

function TEditForm1.ShowDATA0025_2(const VALUE: INTEGER; var VALUE1: TEdit;
                                   var VALUE2: TLabel): BOOLEAN ;
begin

  IF DM.TemADOQuery.Active THEN dm.TemADOQuery.Close;
  DM.TemADOQuery.SQL.Clear ;
  DM.TemADOQuery.SQL.Add('select RKEY,MANU_PART_NUMBER,MANU_PART_DESC,CUSTOMER_PTR from data0025 where (PARENT_PTR = 0 or PARENT_PTR is null) and rkey = ' + inttostr(vrkey0025));
  DM.TemADOQuery.Prepared ;
  DM.TemADOQuery.Open ;
  if not DM.TemADOQuery.IsEmpty then
      begin
          VALUE1.Text := DM.TemADOQuery.FieldByName('MANU_PART_NUMBER').AsString ;
          VALUE2.Caption := DM.TemADOQuery.FieldByName('MANU_PART_DESC').AsString ;
          
      end;
  DM.TemADOQuery.Close ;
end;

procedure TEditForm1.N1Click(Sender: TObject);
var
 LBMFrm: TfrmBMList;
begin
        if trim(Edit12.Text)='' then
        begin
          messagedlg('请先确定本厂编号！',mtinformation,[mbok],0);
          Exit;
          Edit12.SetFocus ;
        end;
        LBMFrm := TfrmBMList.Create(Self);
        LBMFrm.FRkey25 := IntToStr(vrkey0025);
        LBMFrm.rg1Click(LBMFrm.rg1);
        try
          if LBMFrm.ShowModal = mrOK then
          begin
            if not LBMFrm.adsBMList.IsEmpty then
            begin
              dm.ADOQ0118.Append;
              if not dm.ADOQ0101rkey.IsNull then
              dm.ADOQ0118SOURCE_PTR.AsInteger := dm.ADOQ0101rkey.AsInteger;
              dm.ADOQ0118RESP_DEPT_PTR.AsInteger := LBMFrm.adsBMList.fieldbyname('rkey').AsInteger;
              dm.ADOQ0118FLAG.AsBoolean := true;
              dm.ADOQ0118qty.AsInteger := 0 ;
            end;
          end;
        finally
          LBMFrm.Free;
        end;

end;

procedure TEditForm1.FormCreate(Sender: TObject);
begin
 file_name:=tstringlist.Create;
end;

procedure TEditForm1.N30Click(Sender: TObject);
var i:integer;
    s:string;
    fs: TMemoryStream;
begin
  OpenDialog1.DefaultExt :='*.*';
  OpenDialog1.Filter :='';
  if OpenDialog1.Execute then
  begin
    for i:=length(OpenDialog1.FileName) downto 1 do
    begin
      if  OpenDialog1.FileName[i]<>'\' then
         s:=OpenDialog1.FileName[i]+s
      else
         break;
    end;
    fs := TMemoryStream.Create;
    fs.LoadFromFile(OpenDialog1.FileName);
    if fs.Size>10*1024*1024 then
    begin
      showmessage('文件大小不能超过10M,请重新整理文件再保存...');
      fs.Free;
      exit;
    end;

    PackStream(fs);
    dm.ADO148.Append;
    dm.ADO148rec_no.Value:=dm.ado148.RecordCount;
    dm.ADO148SOURCE_PTR.Value:=DM.ADOQALL2RKEY.Value;
    dm.ADO148file_name.Value:=s;
    dm.ADO148in_date.Value:=getsystem_date(dm.TemADOQuery1,1);
    dm.ADO148.Post;
    file_name.Add(OpenDialog1.FileName+';'+'0');
    fs.Free;
  end;
end;


procedure TEditForm1.N31Click(Sender: TObject);
var
 step_number:word;
begin
if Msg_Dlg_Ask('您确定要删除该记录吗?','提示信息',1) then
 begin
  file_name.Delete(dm.ADO148rec_no.Value);
  if dm.ADO148.RecNo=dm.ado148.RecordCount then
   dm.ado148.Delete
  else
   begin
    dm.ADO148.Delete;
    step_number := dm.ADO148.RecNo;
    while not dm.ADO148.Eof do
     begin
      dm.ADO148.Edit;
      dm.ADO148rec_no.Value:=dm.ADO148rec_no.Value-1;
      dm.ADO148.Post;
      dm.ADO148.Next;
     end;
    dm.ADO148.MoveBy(step_number-dm.ADO148.RecNo);
   end;
 end;
end;




procedure TEditForm1.N32Click(Sender: TObject);
var
 str:string;
begin
 str:=dm.ADO148remark.Value;
 if inputquery('编辑备注','文件备注说明:       ',str) then
 begin
  dm.ADO148.Edit;
  dm.ADO148remark.Value:=str;
  dm.ADO148.Post;
 end;
end;

procedure TEditForm1.N33Click(Sender: TObject);
var
 filename,f:string;
 fs: TMemoryStream;
begin
if copy(file_name.Strings[dm.ado148rec_no.value],
        pos(';',file_name.Strings[dm.ADO148rec_no.value])+1,1)='1' then
  begin
    DM.TemADOQuery1.Close;
    DM.TemADOQuery1.SQL.Text:='select vcut_bmp FROM Data0148 where rkey='+dm.ADO148rkey.AsString;
    DM.TemADOQuery1.Open;
    if dm.TemADOQuery1.fieldbyname('vcut_bmp').IsNull then
    begin
      showmessage('此文档为空...');
      exit;
    end;
    fs := TMemoryStream.Create;
    TBlobfield(dm.TemADOQuery1.fieldbyname('vcut_bmp')).SaveToStream(fs);
    UnPackStream(fs);
    if not DirectoryExists(TmpFileDir) then
      if not CreateDir(TmpFileDir) then
        raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
    f:=TmpFileDir+dm.ado148file_name.AsString;
    fs.SaveToFile(f);
    fs.Free;
    ShellExecute(self.Handle,nil,pchar(f),nil,nil,SW_SHOWNORMAL);
  end
  else
   begin
    filename:= copy(file_name.Strings[dm.ADO148rec_no.value],1,
                     pos(';',file_name.Strings[dm.ADO148rec_no.value])-1);
    ShellExecute(self.Handle,nil,pchar(filename),nil,nil,SW_SHOWNORMAL);
   end;
end;

procedure TEditForm1.update_filename;
var
 M: TMemoryStream;
 filename:string;
begin
  dm.ado148.UpdateBatch(arAll);
  M:=TMemoryStream.Create;
  dm.ADO148.First;
  while not dm.ADO148.Eof do
  begin
   if copy(file_name.Strings[dm.ADO148rec_no.value],
           pos(';',file_name.Strings[dm.ADO148rec_no.value])+1,
           1)='0' then
    begin
      M.Clear;
      filename:= copy(file_name.Strings[dm.ADO148rec_no.value],1,
                     pos(';',file_name.Strings[dm.ADO148rec_no.value])-1);
      M.LoadFromFile(filename);
      PackStream(M);
      dm.TemADOQuery1.Close;
      dm.TemADOQuery1.SQL.text:='update data0148 set vcut_bmp=:F where rec_no='+dm.ADO148rec_no.AsString+
                         ' and SOURCE_PTR='+dm.ADO148SOURCE_PTR.AsString;
      dm.TemADOQuery1.Parameters[0].LoadFromStream(M,ftblob);
      dm.TemADOQuery1.ExecSQL;
    end;
   dm.ADO148.next;
  end;
  M.Free;
end;


procedure TEditForm1.PopupMenu2Popup(Sender: TObject);
begin
  N31.Enabled:=not DM.ADO148.IsEmpty;
  N32.Enabled:=not DM.ADO148.IsEmpty;
  N33.Enabled:=not DM.ADO148.IsEmpty;
end;

end.
