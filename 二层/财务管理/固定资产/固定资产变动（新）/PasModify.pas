unit PasModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Mask, DBCtrls,db,
  DBCtrlsEh, Buttons, Menus, ComCtrls, ADODB;

type
  TfrmModify = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    PageControl3: TPageControl;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit23: TDBEdit;
    PageControl4: TPageControl;
    TabSheet4: TTabSheet;
    DBGridEh2: TDBGridEh;
    Label1: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    DBEdit24: TDBEdit;
    Label23: TLabel;
    Label25: TLabel;
    DBEdit26: TDBEdit;
    Label26: TLabel;
    DBEdit27: TDBEdit;
    Shape3: TShape;
    Label27: TLabel;
    DBEdit28: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    Label30: TLabel;
    DBEdit31: TDBEdit;
    Label31: TLabel;
    DBEdit32: TDBEdit;
    Shape4: TShape;
    Label32: TLabel;
    Panel5: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    pcOriginal: TPageControl;
    TabSheet5: TTabSheet;
    dbOriginal: TDBGridEh;
    pcDepart: TPageControl;
    TabSheet6: TTabSheet;
    dbDepart: TDBGridEh;
    cbbType: TComboBox;
    cbbStatus: TComboBox;
    cbbWorkHoure: TComboBox;
    btnSearch: TBitBtn;
    edtNUMBER: TEdit;
    edtName: TEdit;
    DBMemo1: TDBMemo;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    PopupMenu1: TPopupMenu;
    NAdd: TMenuItem;
    NEdit: TMenuItem;
    NDelete: TMenuItem;
    Label35: TLabel;
    edtAccNAME: TEdit;
    Label36: TLabel;
    edtID: TEdit;
    btnS: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSClick(Sender: TObject);
    procedure NAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cbbTypeChange(Sender: TObject);
    procedure cbbStatusChange(Sender: TObject);
    procedure cbbWorkHoureChange(Sender: TObject);
    procedure DBEdit26KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit27KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit26Exit(Sender: TObject);
    procedure DBEdit27Exit(Sender: TObject);
  private
    procedure LoadField;
    procedure LoadCBB(tmp:TADOQuery);
    procedure enableCon(ibool:Boolean);
    procedure GetData(a,b,c,d,e,f:Integer);
    { Private declarations }
  public
    istatus:Integer;
    { Public declarations }
  end;

var
  frmModify: TfrmModify;

implementation

uses DAMO, PasNumber,common,Pick_Item_Single,ConstVar, PasChang,
  PasDepartChang;

{$R *.dfm}

procedure TfrmModify.FormShow(Sender: TObject);
begin
  if istatus < 4 then
  begin
    Caption:='新增';
    pcOriginal.Visible:= istatus=1;
    pcDepart.Visible:= istatus=2;
    if not (istatus=3) then  Self.enableCon(False);

  end
  else
  begin
    with DM.ado327 do
    begin
      Close;
      Parameters[0].Value:= DM.adoMainrkey.Value;
      Open;
    end;
    with DM.ado327_1 do
    begin
      Close;
      Parameters[0].Value:= DM.adoMainrkey327.Value;
      Open;
    end;

    if DM.adoMainalter_type.Value=1 then
    begin
      Caption:='原值变更';
      pcOriginal.Visible:=True;
      with DM.ado325_1 do
      begin
        Close;
        Parameters[0].Value:= 0;
        Parameters[1].Value:= DM.adoMainrkey327.Value;
        Parameters[2].Value:=2;
        Open;
      end;
      GetData(0,DM.adoMainrkey327.Value,1,DM.adoMainrkey.Value,0,0);
      DM.DataSource8.DataSet:=dm.ado325_1;
      Self.enableCon(False);
      btnSearch.Enabled:=False;
    end
    else if DM.adoMainalter_type.Value=2 then
    begin
      Caption:='部门变更';
      pcDepart.Visible:=True;
      with DM.ado326_1 do
      begin
        Close;
        Parameters[0].Value:= 0;
        Parameters[1].Value:= DM.adoMainrkey327.Value;
        Parameters[2].Value:=2;
        Open;
      end;
      GetData(DM.adoMainrkey.Value,0,0,0,DM.adoMainrkey327.Value,1);
      DM.DataSource8.DataSet:=dm.ado326_1;
      Self.enableCon(False);
      btnSearch.Enabled:=False;
    end
    else
    begin
      Caption:='其它变更';
      GetData( DM.adoMainrkey.Value,0,0,DM.adoMainrkey.Value,0,0);
    end;
    edtID.Text:= DM.ado327fasset_code.AsString;
    edtID.Tag:= DM.ado327rkey.AsInteger;
    edtAccNAME.Text:= DM.ado327fasset_name.AsString;
    Self.LoadCBB(DM.ado327_1);

    btnS.Enabled:=False;
    if istatus=5 then
    begin
      btnSave.Enabled:=False;
      btnSearch.Enabled:=False;
      PopupMenu1.AutoPopup:=False;
      DBMemo1.Enabled:=False;
      DBDateTimeEditEh1.Enabled:=False;
    end;
  end;
end;

procedure TfrmModify.btnSearchClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'GL_ACC_NUMBER/科目代码/100,description_2/科目名称/300';
    InputVar.Sqlstr := 'SELECT dbo.Data0103.RKEY,Data0103.GL_ACC_NUMBER '+
                       ' ,ISNULL(Data0103_1.GL_DESCRIPTION,''根目录'')+ ''-'' + Data0103.GL_DESCRIPTION AS description_2 '+
                       ' ,DBO.Data0103.GL_DESCRIPTION '+#13+
                       ' FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN ' +#13+
                       '   dbo.Data0103 Data0103_1 ON Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN '+#13+
                       '   dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR  '+#13+
                       '  WHERE dbo.Data0103.HAS_CHILD = 0 AND dbo.Data0103.ACTIVE_FLAG=''Y''' +#13+
                       ' ORDER By Data0103.GL_ACC_NUMBER ';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtNUMBER.Text:= frmPick_Item_Single.adsPick.fieldbyname('GL_ACC_NUMBER').AsString;
      edtName.Text:= frmPick_Item_Single.adsPick.fieldbyname('GL_DESCRIPTION').AsString;

      DM.ado327_1.Edit;
      DM.ado327_1DEPRE_ACCT_PTR_1.Value:= frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmModify.LoadCBB(tmp:TADOQuery);
begin
  if  tmp.FieldByName('fasset_type_ptr_1').Value <> 0 then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Text:= 'select RKEY,FASSET_TYPE from data0514 order by rkey';
      Open;
      First;
      while not Eof do
      begin
        cbbType.Items.AddObject(Fields[1].Value,Pointer(Fields[0].AsInteger));
        if tmp.FieldByName('fasset_type_ptr_1').Value = Fields[0].Value then
          cbbType.ItemIndex:= DM.adoTmp.RecNo - 1;
        Next;
      end;
    end;
  end;

  if  tmp.FieldByName('status_ptr_1').Value <> 0 then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Text:= 'select RKEY,FASSET_STATUS from data0516 order by rkey';
      Open;
      First;
      while not Eof do
      begin
        cbbStatus.Items.AddObject(Fields[1].Value,Pointer(Fields[0].AsInteger));
        if tmp.FieldByName('status_ptr_1').Value = Fields[0].Value then
          cbbStatus.ItemIndex:= DM.adoTmp.RecNo - 1;
        Next;
      end;
    end;
  end;

  if  tmp.FieldByName('dept_ptr_1').Value <> 0 then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Text:= 'select RKEY,ABBR_NAME from data0015 order by rkey';
      Open;
      First;
      while not Eof do
      begin
        cbbWorkHoure.Items.AddObject(Fields[1].Value,Pointer(Fields[0].AsInteger));
        if tmp.FieldByName('dept_ptr_1').Value = Fields[0].Value then
          cbbWorkHoure.ItemIndex:= DM.adoTmp.RecNo - 1;
        Next;
      end;
    end;
  end;

  if tmp.FieldByName('DEPRE_ACCT_PTR_1').Value<>0 then
  begin
    with DM.adoTmp do
    begin
      Close;
      SQL.Text:= 'select GL_ACC_NUMBER,GL_DESCRIPTION from data0103 where RKEY= ' + tmp.FieldByName('DEPRE_ACCT_PTR_1').AsString;
      Open;
      edtNUMBER.Text:=Fields[0].Value;
      edtName.Text:=Fields[1].Value;
    end;
  end;
end;

procedure TfrmModify.btnSClick(Sender: TObject);
var
  InputVar:PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'fasset_code/卡片号/80,fasset_name/资产名称/100,fasset_desc/资产规格/200';
    InputVar.Sqlstr := 'select rkey,fasset_code,fasset_name,fasset_desc from data0517 where active_flag=1 order by rkey';
    Inputvar.KeyField:='';

    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtID.Text:= frmPick_Item_Single.adsPick.fieldbyname('fasset_code').AsString;
      edtID.Tag:=frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
      edtAccNAME.Text:= frmPick_Item_Single.adsPick.fieldbyname('fasset_name').AsString;

      DM.ado327.Close;
      DM.ado327.Parameters[0].Value:= frmPick_Item_Single.adsPick.fieldbyname('rKey').AsInteger;
      DM.ado327.Open;

      GetData(edtID.Tag,0,0,edtID.Tag,0,0);

      IF istatus=1 THEN
      BEGIN
        DM.DataSource8.DataSet:=DM.ado325_1;
        dm.ado325_1.Close;
        DM.ado325_1.Parameters[0].Value:= edtID.Tag;
        DM.ado325_1.Parameters[1].Value:=0;
        DM.ado325_1.Parameters[2].Value:=0;
        DM.ado325_1.Open;
      END;
      IF istatus=2 then
      BEGIN
        DM.DataSource8.DataSet:=DM.ado326_1;
        dm.ado326_1.Close;
        DM.ado326_1.Parameters[0].Value:= edtID.Tag;
        DM.ado326_1.Parameters[1].Value:=0;
        DM.ado326_1.Parameters[2].Value:=0;
        DM.ado326_1.Open;
      END;
      Self.LoadField;
      Self.LoadCBB(DM.ado327_1);
    end;
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TfrmModify.LoadField;
begin
   DM.ADO327_1.Close;
   DM.ADO327_1.Parameters[0].Value:=0;
   DM.ADO327_1.Open;

   DM.ADO327_1.Append;
   DM.ADO327_1.FieldByName('fasset_ptr').Value:=DM.ADO327.fieldbyname('rkey').Value;

   DM.adoTmp.Close;
   DM.adoTmp.SQL.Text:='select curr_fyear,curr_period from data0508';
   DM.adoTmp.Open;

   DM.ADO327_1.FieldByName('alter_date').Value:=encodedate(DM.adoTmp.Fields[0].asinteger,DM.adoTmp.Fields[1].asinteger,15);
   DM.ADO327_1.FieldByName('alter_type').Value:= istatus;
   DM.ADO327_1.FieldByName('ORIGINAL_VALUE').Value:=DM.ADO327.fieldbyname('ORIGINAL_VALUE').Value;
   DM.ADO327_1.FieldByName('SUMMED_DEPRE').Value:=DM.ADO327.fieldbyname('SUMMED_DEPRE').Value;
   DM.ADO327_1.FieldByName('NET_VALUE').Value:=DM.ADO327.fieldbyname('NET_VALUE').Value;
   DM.ADO327_1.FieldByName('LOCATION').Value:=DM.ADO327.fieldbyname('LOCATION').Value;
   DM.ADO327_1.FieldByName('SURPLUS_RATE').Value:=DM.ADO327.fieldbyname('SURPLUS_RATE').Value;
   DM.ADO327_1.FieldByName('SURPLUS').Value:=DM.ADO327.fieldbyname('SURPLUS').Value;
   DM.ADO327_1.FieldByName('DEPRE_MTHD_PTR').Value:=DM.ADO327.fieldbyname('DEPRE_MTHD_PTR').Value;
   DM.ADO327_1.FieldByName('EXPECTED_LIFE_MONTHS').Value:=DM.ADO327.fieldbyname('EXPECTED_LIFE_MONTHS').Value;
   DM.ADO327_1.FieldByName('DEPRED_MONTHS').Value:=DM.ADO327.fieldbyname('DEPRED_MONTHS').Value;
   DM.ADO327_1.FieldByName('MONTH_DEPRE_RATE').Value:=DM.ADO327.fieldbyname('MONTH_DEPRE_RATE').Value;
   DM.ADO327_1.FieldByName('MONTH_DEPRE_AMT').Value:=DM.ADO327.fieldbyname('MONTH_DEPRE_AMT').Value;
   DM.ADO327_1.FieldByName('DEPRE_ACCT_PTR').Value:=DM.ADO327.fieldbyname('DEPRE_ACCT_PTR').Value;
   DM.ADO327_1.FieldByName('alter_by_ptr').Value:=strtoint(user_ptr);
   DM.ADO327_1.FieldByName('fasset_type_ptr').Value:=DM.ADO327.fieldbyname('fasset_type_ptr').Value;
   DM.ADO327_1.FieldByName('status_ptr').Value:=DM.ADO327.fieldbyname('status_ptr').Value;
   DM.ADO327_1.FieldByName('DEPT_PTR').Value:=DM.ADO327.fieldbyname('warehouse_ptr').Value;

   DM.ADO327_1.FieldByName('LOCATION_1').Value:=DM.ADO327_1.FieldByName('LOCATION').Value;
   DM.ADO327_1.FieldByName('dept_ptr_1').Value:=DM.ADO327_1.FieldByName('DEPT_PTR').Value;
   DM.ADO327_1.FieldByName('fasset_type_ptr_1').Value:=DM.ADO327_1.FieldByName('fasset_type_ptr').Value;
   DM.ADO327_1.FieldByName('status_ptr_1').Value:=DM.ADO327_1.FieldByName('status_ptr').Value;
   DM.ADO327_1.FieldByName('EXPECTED_LIFE_MONTHS_1').Value:=DM.ADO327_1.FieldByName('EXPECTED_LIFE_MONTHS').Value;
   DM.ADO327_1.FieldByName('SURPLUS_RATE_1').Value:=DM.ADO327_1.FieldByName('SURPLUS_RATE').Value;
   DM.ADO327_1.FieldByName('ORIGINAL_VALUE_1').Value:=DM.ADO327_1.FieldByName('ORIGINAL_VALUE').Value;
   DM.ADO327_1.FieldByName('SUMMED_DEPRE_1').Value:=DM.ADO327_1.FieldByName('SUMMED_DEPRE').Value;
   DM.ADO327_1.FieldByName('NET_VALUE_1').Value:=DM.ADO327_1.FieldByName('NET_VALUE').Value;
   DM.ADO327_1.FieldByName('SURPLUS_1').Value:=DM.ADO327_1.FieldByName('SURPLUS').Value;
   DM.ADO327_1.FieldByName('DEPRE_MTHD_PTR_1').Value:=DM.ADO327_1.FieldByName('DEPRE_MTHD_PTR').Value;
   DM.ADO327_1.FieldByName('DEPRED_MONTHS_1').Value:=DM.ADO327_1.FieldByName('DEPRED_MONTHS').Value;
   DM.ADO327_1.FieldByName('MONTH_DEPRE_RATE_1').Value:=DM.ADO327_1.FieldByName('MONTH_DEPRE_RATE').Value;
   DM.ADO327_1.FieldByName('MONTH_DEPRE_AMT_1').Value:=DM.ADO327_1.FieldByName('MONTH_DEPRE_AMT').Value;
   DM.ADO327_1.FieldByName('DEPRE_ACCT_PTR_1').Value:=DM.ADO327_1.FieldByName('DEPRE_ACCT_PTR').Value;
end;

procedure TfrmModify.GetData(a, b, c, d, e, f: Integer);
begin
  with DM.ado325_2 do
  begin
    Close;
    Parameters[0].Value:= a;
    Parameters[1].Value:= b;
    Parameters[2].Value:= c;
    Open;
  end;
  with DM.ado326_2 do
  begin
    Close;
    Parameters[0].Value:= d;
    Parameters[1].Value:= e;
    Parameters[2].Value:= f;
    Open;
  end;
end;

procedure TfrmModify.NAddClick(Sender: TObject);
begin
    case TMenuItem(Sender).Tag of
      0,1:
      begin
        if not DM.ado327.Active then Exit;
        if TMenuItem(Sender).Tag=0 then DM.DataSource8.DataSet.Append
        else DM.DataSource8.DataSet.Edit;
        if DM.DataSource8.DataSet=DM.ADO325_1 then
        begin
          if (TMenuItem(Sender).Tag=1)  and (DM.ado325_1.RecNo <= DM.ado325_2.RecordCount) then
          begin
            ShowMessage('只能对新增的或最后一条记录进行操作');
            exit;
          end;
          try
            frmChang:=TfrmChang.Create(nil);
            if frmChang.showmodal=mryes then
            begin
              DM.DataSource8.DataSet.Post;
            end
            else DM.DataSource8.DataSet.Cancel;
          finally
            frmChang.Free
          end;
        end
        else
        begin
//          if (DM.ado326_1.RecNo <> DM.ado326_1.RecordCount) and (DM.ado326_1.RecNo < DM.ado326_2.RecordCount) then
//          begin
//            ShowMessage('只能对最后一条记录进行操作');
//            exit;
//          end;
          try
            frmDepartChang:=TfrmDepartChang.Create(nil);
            if frmDepartChang.showmodal=mryes then
            begin
              DM.DataSource8.DataSet.Post;
            end
            else
            DM.DataSource8.DataSet.Cancel;
          finally
            frmDepartChang.Free;
          end;
        end;
      end;
      2:
      begin
        if not DM.ado327.Active then Exit;
        if DM.DataSource8.DataSet=DM.ado325_1 then
          if (DM.ado325_1.RecNo <> DM.ado325_1.RecordCount) and (DM.ado325_1.RecNo <= DM.ado325_2.RecordCount) then
          begin
            ShowMessage('只能对新增的或最后一条记录进行操作');
            exit;
          end;
        if (DM.DataSource8.DataSet=DM.ado326_1) and (DM.ado326_1.RecNo <= DM.ado326_2.RecordCount) then
        begin
          ShowMessage('只能对新增的或最后一条记录进行操作');
          exit;
        end;
         DM.DataSource8.DataSet.Delete;
         if DM.DataSource8.DataSet=DM.ADO325_1 then DM.ado325_1AfterPost(DM.ado325_1);
      end;
    end;
end;

procedure TfrmModify.btnSaveClick(Sender: TObject);
var
    Y,M,D:word;
    Per:Double;
    dept_ptr:integer;
    evt:TDataSetNotifyEvent;
begin
  if trim(DBMemo1.Text)='' then
  begin
    showmessage('请输入变更原因后再保存');
    exit;
  end;
  if trim(edtNUMBER.Text)='' then
  begin
    showmessage('请输入累计折旧科目');
    exit;
  end;
  if pcOriginal.Visible and dbOriginal.DataSource.DataSet.IsEmpty then
  begin
    showmessage('请输入固定资产原值');
    exit;
  end;
  if pcDepart.Visible and dbDepart.DataSource.DataSet.IsEmpty then
  begin
    showmessage('请输入部门信息');
    exit;
  end;

  if pcDepart.Visible then
  begin
    Per:=0;
    DM.ADO326_1.First;
    while not DM.ADO326_1.Eof do
    begin
      Per:=Per + DM.ADO326_1PERCENTS.Value;
      dept_ptr:=DM.ADO326_1dept_ptr.AsInteger;
      DM.ADO326_1.Filter:='dept_ptr='+DM.ADO326_1dept_ptr.AsString;
      DM.ADO326_1.Filtered:=true;
      if DM.ADO326_1.RecordCount >1 then
      begin
        ShowMsg('部门不允许重复',1);
        DM.ADO326_1.Filter:='';
        DM.ADO326_1.Filtered:=false;
        exit;
      end
      else
      begin
        DM.ADO326_1.Filter:='';
        DM.ADO326_1.Filtered:=false;
        DM.ADO326_1.Locate('dept_ptr',dept_ptr,[]);
      end;
      DM.ADO326_1.Next;
    end;
    if Per<>100 then
    begin
      showmessage('使用部门百分比不合法');
      exit;
    end;
  end;

  DecodeDate(DM.ado327_1alter_date.AsDateTime,Y,M,D);
  DM.adoTmp.Close;
  DM.adoTmp.SQL.Text:='select curr_fyear,curr_period,depre_flag from data0508';
  DM.adoTmp.Open;
  if (Y<>DM.adoTmp.Fields[0].AsInteger) or (M<>DM.adoTmp.Fields[1].AsInteger) then
  begin
    showmessage('变更日期必须为当前会计期间:'+DM.adoTmp.Fields[0].asstring+'/'+DM.adoTmp.Fields[1].asstring);
    exit;
  end;
  if DM.adoTmp.Fields[2].AsInteger=1 then
  begin
    showmessage('当前会计期间已提取折旧,不能再变更操作');
    exit;
  end;

  try
    DM.ADOConnection1.BeginTrans;
    if istatus<5 then DM.ado327_1.UpdateBatch(arAll);
//    ShowMessage(DM.ado327_1fasset_type_ptr_1.AsString);
    if istatus=1 then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Text:=' insert into data0325(fasset_ptr, curr_ptr, d327_ptr, ex_rate, orig_curr_orig_value, chgType) '+#13+
                  ' SELECT null, curr_ptr,' + DM.ado327_1rkey.AsString + ', ex_rate, orig_curr_orig_value, 1 '+#13+
                  ' FROM data0325 where fasset_ptr= ' + DM.ado327rkey.AsString + ' and  chgtype=0';
        ExecSQL;
      end;
//      ShowMessage(DM.ado327rkey.AsString);
      with dm.ado325_1 do
      begin
        First;
        evt:=DM.ADO325_1.AfterPost;                            //????
        DM.ADO325_1.AfterPost:=nil;
        while not Eof do
        begin
          Edit;
          FieldByName('fasset_ptr').Value:=DM.ado327rkey.AsInteger;
          FieldByName('d327_ptr').Value:= null;
          FieldByName('chgtype').Value:= 0;
          Post;
          Next;
        end;
        DM.ADO325_1.AfterPost:=evt;
        UpdateBatch(arAll);
      end;

      with DM.adoTmp do
      begin
        Close;
        SQL.Text:=' insert into data0325(fasset_ptr, curr_ptr, d327_ptr, ex_rate, orig_curr_orig_value, chgType) '+#13+
                  ' SELECT null, curr_ptr,' + DM.ado327_1rkey.AsString + ', ex_rate, orig_curr_orig_value, 2 '+#13+
                  ' FROM data0325 where fasset_ptr= ' + DM.ado327rkey.AsString  ;
        ExecSQL;
      end;
    end
    else
    if istatus=2 then
    begin
      with DM.adoTmp do
      begin
        Close;
        SQL.Text:=' insert into data0326(fasset_ptr, dept_ptr, FACCU_DEPT_GL_PTR, d327_ptr, PERCENTS, chgType) '+#13+
                  ' SELECT null, dept_ptr, FACCU_DEPT_GL_PTR,' + DM.ado327_1rkey.AsString + ',PERCENTS,  1 '+#13+
                  ' FROM data0326 where fasset_ptr= ' + DM.ado327rkey.AsString + ' and  chgtype=0';
        ExecSQL;
      end;

      with dm.ado326_1 do
      begin
        First;
        while not Eof do
        begin
          Edit;
          FieldByName('fasset_ptr').Value:=DM.ado327rkey.AsInteger;
          FieldByName('d327_ptr').Value:= null;
          FieldByName('chgtype').Value:= 0;
          Post;
          Next;
        end;
        UpdateBatch(arAll);
      end;

      with DM.adoTmp do
      begin
        Close;
        SQL.Text:=' insert into data0326(fasset_ptr, dept_ptr, FACCU_DEPT_GL_PTR, d327_ptr, PERCENTS, chgType) '+#13+
                   ' SELECT null, dept_ptr, FACCU_DEPT_GL_PTR,' + DM.ado327_1rkey.AsString + ',PERCENTS,  2 '+#13+
                  ' FROM data0326 where fasset_ptr= ' + DM.ado327rkey.AsString  ;
        ExecSQL;
      end;
    end
    else
    if istatus=4 then
    begin
//      ShowMessage(DM.ado327_1.SQL.Text);
//      ShowMessage(IntToStr(DM.ado327_1rkey.AsInteger));
//      ShowMessage(IntToStr(DM.ado327_1alter_type.AsInteger));
      if DM.ado327_1alter_type.AsInteger = 1 then
      begin
        with DM.ADO325_1 do
        begin
          First;
          evt:=DM.ADO325_1.AfterPost;
          DM.ADO325_1.AfterPost:=nil;
          while not Eof do
          begin
            Edit;
            FieldByName('chgType').Value:=2;
            FieldByName('fasset_ptr').AsVariant:=null;
            FieldByName('d327_ptr').Value:=Dm.ADO327_1rkey.AsInteger;
            Post;
            Next;
          end;
          DM.ADO325_1.AfterPost:=evt;
          UpdateBatch(arAll);
        end;

        DM.adoTmp.Close;
        DM.adoTmp.SQL.Text:='delete from data0325 where fasset_ptr='+DM.ADO327rkey.asstring;
        DM.adoTmp.ExecSQL;
        DM.adoTmp.SQL.Text:='insert into data0325 (fasset_ptr, curr_ptr, d327_ptr, ex_rate, orig_curr_orig_value, chgType) '+
                         'SELECT '+DM.ADO327rkey.asstring+', curr_ptr,null, ex_rate, orig_curr_orig_value, 0 ' +
                         'FROM data0325 where chgType=2 and d327_ptr='+Dm.ADO327_1rkey.asstring;
        DM.adoTmp.ExecSQL;
      end
      else if DM.ado327_1alter_type.AsInteger = 2 then
      begin
        with DM.ADO326_1 do
        begin
          First;
          while not Eof do
          begin
            Edit;
            FieldByName('chgType').Value:=2;
            FieldByName('fasset_ptr').AsVariant:=null;
            FieldByName('d327_ptr').Value:=Dm.ADO327_1rkey.AsInteger;
            Post;
            Next;
          end;
          UpdateBatch(arAll);
        end;
        with DM.adoTmp do
        begin
          Close;
          SQL.Text:='delete from data0326 where fasset_ptr='+DM.ADO327rkey.asstring;
          ExecSQL;
          Close;
          SQL.Text:='insert into data0326 (fasset_ptr, dept_ptr, FACCU_DEPT_GL_PTR, d327_ptr, PERCENTS, chgType) '+
                           'SELECT '+DM.ADO327rkey.asstring+', dept_ptr,FACCU_DEPT_GL_PTR,null, PERCENTS, 0 ' +
                           'FROM data0326 where chgType=2 and d327_ptr='+Dm.ADO327_1rkey.asstring;
          DM.adoTmp.ExecSQL;
        end;
      end;
    end;

    DM.adoTmp.Close;
    DM.adoTmp.SQL.Text:='update data0517 set warehouse_ptr=b.dept_ptr_1, fasset_type_ptr=b.fasset_type_ptr_1,'+
                                          'status_ptr=b.status_ptr_1, ORIGINAL_VALUE=b.ORIGINAL_VALUE_1,'+
                                          'NET_VALUE=b.NET_VALUE_1,LOCATION=b.LOCATION_1,'+
                                          'SURPLUS_RATE=b.SURPLUS_RATE_1, SURPLUS=b.SURPLUS_1,'+
                                          'EXPECTED_LIFE_MONTHS=b.EXPECTED_LIFE_MONTHS_1, MONTH_DEPRE_RATE=b.MONTH_DEPRE_RATE_1,'+
                                          'MONTH_DEPRE_AMT=b.MONTH_DEPRE_AMT_1, DEPRE_ACCT_PTR=b.DEPRE_ACCT_PTR_1 '+
                     'from data0517 d517 inner join data0327 b on d517.rkey=b.fasset_ptr '+
                     'where b.rkey='+DM.ADO327_1rkey.AsString ;
//    ShowMessage(DM.adoTmp.SQL.Text);
    DM.adoTmp.ExecSQL;
    DM.ADOConnection1.CommitTrans;
    modalresult:=mrYes;
  except
    on e:exception do
    begin
      DM.ADOConnection1.RollbackTrans;
      showmessage('保存数据发生错误:'+e.Message);
    end;
  end;
end;

procedure TfrmModify.cbbTypeChange(Sender: TObject);
begin
  DM.ado327_1.Edit;
  DM.ado327_1fasset_type_ptr_1.Value:=Integer(cbbType.Items.Objects[cbbType.ItemIndex]);
  DM.ado327_1.Post;
//  ShowMessage(IntToStr(Integer(cbbType.Items.Objects[cbbType.ItemIndex])));
end;

procedure TfrmModify.cbbStatusChange(Sender: TObject);
begin
  DM.ado327_1.Edit;
  DM.ado327_1status_ptr_1.Value:=Integer(cbbStatus.Items.Objects[cbbStatus.ItemIndex]);
  DM.ado327_1.Post;
end;

procedure TfrmModify.cbbWorkHoureChange(Sender: TObject);
begin
  DM.ado327_1.Edit;
  DM.ado327_1dept_ptr_1.Value:=Integer(cbbWorkHoure.Items.Objects[cbbWorkHoure.ItemIndex]);
  DM.ado327_1.Post;
end;

procedure TfrmModify.enableCon(ibool: Boolean);
begin
  cbbType.Enabled:=ibool;
  cbbStatus.Enabled:=ibool;
  cbbWorkHoure.Enabled:=ibool;
  DBEdit24.Enabled:=ibool;
  DBEdit26.Enabled:=ibool;
  DBEdit27.Enabled:=ibool;
  btnSearch.Enabled:=ibool;
end;

procedure TfrmModify.DBEdit26KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8]) then Abort;
end;

procedure TfrmModify.DBEdit27KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9',#8,#46]) then
  begin
    if (Key = #46) and (Pos('.',Trim(TEdit(Sender).Text))<>0) then
    Abort;
  end
  else Abort;
end;

procedure TfrmModify.DBEdit26Exit(Sender: TObject);
begin
  if (DBEdit26.Field.AsInteger<1) or (DBEdit26.Field.AsInteger>840) then
  begin
    showmessage('预计使用月份不正确');
    exit;
  end;
end;

procedure TfrmModify.DBEdit27Exit(Sender: TObject);
begin
  if (DBEdit27.Field.AsInteger<0) or (DBEdit27.Field.AsInteger>=100) then
  begin
    showmessage('输入残值率不正确');
    exit;
  end;
end;

end.
