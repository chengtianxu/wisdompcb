unit UDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, daDataModule, ComCtrls,ExtDlgs,jpeg, DBCtrls, CommCtrl,StrUtils,DateUtils,
  OleCtrls, SHDocVw;

  const NameLen	= 30;
  const SexLen	= 5;
  const NationLen	= 10;
  const DateLen	= 8;
  const AddrLen	= 70;
  const IdLen	= 18;
  const DepartmentLen	= 30;
  const ReserveLen = 36;

type
  PeopleBaseInfo = record
    PeoName:           array [0..NameLen]          of char;
    PeoSex:            array [0..SexLen]           of char;
    PeoFolk:           array [0..NationLen]        of char;
    PeoBirthday:       array [0..DateLen]          of char;
    PeoAddress:        array [0..AddrLen]          of char;
    PeoIDNumber:       array [0..IdLen]            of char;
    PeoDepartment:     array [0..DepartmentLen]    of char;
    PeoStartDate:      array [0..DateLen]          of char;
    PeoEndDate:        array [0..DateLen]          of char;
    PeoReserve:        array [0..ReserveLen]       of char;
    paddaddress1:      array [0..AddrLen]          of char;
    m_szphoto:         array [0..1023]             of char;
end;

type
  TDetail_Form = class(TForm)
    Label5: TLabel;
    BtnSave: TBitBtn;
    BitBtn9: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Edit4: TEdit;
    Edit1: TEdit;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    Edit2: TEdit;
    RadioGroup1: TRadioGroup;
    DateTimePicker3: TDateTimePicker;
    ComboBox3: TComboBox;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit9: TEdit;
    ComboBox10: TComboBox;
    ComboBox12: TComboBox;
    ComboBox13: TComboBox;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    Edit10: TEdit;
    RadioGroup2: TRadioGroup;
    Edit13: TEdit;
    Edit16: TEdit;
    ComboBox2: TComboBox;
    ComboBox7: TComboBox;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    Panel1: TPanel;
    Image1: TImage;
    Label25: TLabel;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox4: TGroupBox;
    SGrid: TStringGrid;
    SpeedButton5: TSpeedButton;
    Edit7: TEdit;
    GroupBox5: TGroupBox;
    Label27: TLabel;
    Label29: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Edit8: TEdit;
    Edit12: TEdit;
    Edit01: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    OpenPictureDialog1: TOpenPictureDialog;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label39: TLabel;
    Edit17: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Label26: TLabel;
    Label28: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    ComboBox1: TComboBox;
    Label42: TLabel;
    Edit11: TEdit;
    Edit27: TEdit;
    Label41: TLabel;
    DateTimePicker4: TDateTimePicker;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    Label43: TLabel;
    Edit02: TEdit;
    Label44: TLabel;
    Label45: TLabel;
    ComboBox4: TComboBox;
    Label22: TLabel;
    Edit15: TEdit;
    Label46: TLabel;
    Edit14: TEdit;
    SpeedButton6: TSpeedButton;
    Label47: TLabel;
    Label48: TLabel;
    Edit28: TEdit;
    Label49: TLabel;
    Label50: TLabel;
    Edit29: TEdit;
    Edit30: TEdit;
    Label51: TLabel;
    Edit31: TEdit;
    Label52: TLabel;
    Panel2: TPanel;
    Label53: TLabel;
    Edit32: TEdit;
    Label54: TLabel;
    Memo2: TMemo;
    BitBtn2: TBitBtn;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Label55: TLabel;
    Label56: TLabel;
    Edit33: TEdit;
    Label57: TLabel;
    Edit34: TEdit;
    Label58: TLabel;
    Edit35: TEdit;
    Label59: TLabel;
    btn1: TBitBtn;
    SavePictureDialog1: TSavePictureDialog;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure Edit19KeyPress(Sender: TObject; var Key: Char);
    procedure Edit25KeyPress(Sender: TObject; var Key: Char);
    procedure Edit22KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Edit31Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SGridKeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Exit(Sender: TObject);
    procedure btn1Click(Sender: TObject);
   
  private
     procedure IDCardIsExit(); //检测重复入职
    { Private declarations }
  public
      Ftag:integer;
      contract_rkey: Integer;
      contract_index: Integer;
      idcardisexit_flag :integer;
      idcardisexit_firstrkey : integer;
      procedure initd;
    { Public declarations }
  end;
  function JpegStartsInBlob(PicField:TBlobField):integer;
  function GetBmp(Wlt_File: pchar; intf: integer): integer; stdcall;external 'WltRS.dll';
  function InitComm(iPort: Integer):integer;stdcall;external 'termb.dll';
  function InitComm1(iPort: Integer;iBaud: Integer):integer;stdcall;external 'termb.dll';
  function SetCOMMBaud(iPort: Integer;iBaudRate: Integer):boolean;stdcall;external 'termb.dll';
  function Authenticate():integer;stdcall;external 'termb.dll';
  function Read_Content(iActive : integer):integer;stdcall;external 'termb.dll';
  function CloseComm():integer;stdcall;external 'termb.dll';

  function GetPeopleName(szName:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleSex(szSex:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleNation(szNation:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleBirthday(szBirthday:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleAddress(szAddress:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleIDCode(szID:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetDepartment(szDepartment:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetStartDate(szStartDate:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetEndDate(szEndDate:pchar;iLen:integer):integer;stdcall;external 'termb.dll';

var
  Detail_Form: TDetail_Form;
  m_szDllPath: string;


implementation

uses UDM, common, Pick_Item_Single, ConstVar, UQueDep, UMain;

{$R *.dfm}

procedure TDetail_Form.FormCreate(Sender: TObject);

var i5: Integer;
  QueryTmp: TADOQuery;
begin
  QueryTmp := TADOQuery.Create(Self);
  QueryTmp.Connection := DM.ADOConnection1;
  with QueryTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 5 '+ #13;
    Open;
    i5 := 0;
    first;
    while not Eof do
    begin     
      ComboBox2.Items.AddObject(FieldByName('item').AsString, TObject(FieldByName('rkey').AsInteger));
      if FieldByName('item').AsString ='正式合同' then
        begin
         contract_rkey := FieldByName('rkey').AsInteger;
         contract_index:=i5;
        end;
      i5:=i5+1;
      Next;
    end;
  end;

  with QueryTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 2 '+ #13;
    Open;
    first;
    while not Eof do
    begin
      ComboBox7.Items.AddObject(FieldByName('item').AsString,TObject(FieldByName('rkey').AsInteger));
      Next;
    end;
  end;
  with QueryTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 3 '+ #13;
    Open;
    first;
    while not Eof do
    begin
      ComboBox10.Items.AddObject(FieldByName('item').AsString,TObject(FieldByName('rkey').AsInteger));
      Next;
    end;
  end;
  with QueryTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 17 '+ #13;
    Open;
    first;
    while not Eof do
    begin
      ComboBox4.Items.AddObject(FieldByName('item').AsString,TObject(FieldByName('rkey').AsInteger));
      Next;
    end;
  end;
  with QueryTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 4 '+ #13;
    Open;
    first;
    while not Eof do
    begin
      ComboBox12.Items.AddObject(FieldByName('item').AsString,TObject(FieldByName('rkey').AsInteger));
      Next;
    end;
  end;
  with QueryTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 11 '+ #13;
    Open;
    first;
    while not Eof do
    begin
      ComboBox13.Items.AddObject(FieldByName('item').AsString,TObject(FieldByName('rkey').AsInteger));
      Next;
    end;
  end;
  with QueryTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := ' select getdate() '+ #13;
    Open;
    DateTimePicker1.Date := Fields[0].AsDateTime - 365;
    DateTimePicker2.Date := Fields[0].AsDateTime;
    DateTimePicker3.Date := Fields[0].AsDateTime + 90;
  end;                                                                                                          
  with QueryTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select top 1  * from employeemsg  where status=1  '
      + ' and employeecode not like ''ST%'' order by employeecode  desc ';
    Open;
    Label47.Caption := FieldByName('employeecode').AsString;
  end;
  QueryTmp.Free;
end;


procedure TDetail_Form.initd;
Var
  jpegimage : TJPEGImage;
  PicStream : TADOBlobstream;
  Bitmap: tBitmap;
  QueryTmp: TADOQuery;
  i: Integer;
begin
   // 0,1,3: 新增，编辑，删除  ，4查看
  QueryTmp := TADOQuery.Create(Self);
  QueryTmp.Connection := DM.ADOConnection1;
  if Ftag=0 then
  begin
    DM.employee_msg_1.Close;
    DM.employee_msg_1.Parameters[0].Value := -1;
    DM.employee_msg_1.Open;
    self.Caption := '员工信息-新增';
    Memo1.Text := '点此开始编写履历内容.......';
    Memo1.Font.Color := cl3DDkShadow;
    Image1.Picture.Graphic := nil;
    DateTime_SetFormat(DateTimePicker1.Handle, '''    -  -  ''');
    DateTime_SetFormat(DateTimePicker2.Handle, '''    -  -  ''');
    DateTime_SetFormat(DateTimePicker3.Handle, '''    -  -  ''');
    DateTime_SetFormat(DateTimePicker4.Handle, '''    -  -  ''');
    DateTimePicker1.Hint := '';
    DateTimePicker2.Hint := '';
    DateTimePicker3.Hint := '';
    DateTimePicker4.Hint := '';
    Label2.Font.Color := clRed ;
    Label1.Font.Color := clRed ;
    Label14.Font.Color := clRed ;
    Label17.Font.Color := clRed ;
    Label6.Font.Color := clRed ;
    Label11.Font.Color := clRed ;
    Label8.Font.Color := clRed;
    Edit7.Text := '员工';
    with DM.tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select rkey from datadetail where item='+quotedstr(Edit7.Text);
      Open;
      if not IsEmpty then
        Edit7.Tag := FieldValues['rkey']
      else ShowMessage('没有该职务，请联系管理员！');
    end;
    ComboBox2.ItemIndex := contract_index;
  end
  else
  begin
    if  Ftag=1 then
    begin
      DM.employee_msg_1.Close;
      DM.employee_msg_1.Parameters[0].Value:=DM.employee_msgrkey.AsInteger;
      DM.employee_msg_1.Open;
      self.Caption:='员工信息-修改';
      //SpeedButton5.Enabled := False;
      Edit1.Text := DM.employee_msg_1.FieldByName('employeecode').Value ;
      Edit2.Text := DM.employee_msg_1.FieldByName('chinesename').Value  ;
      RadioGroup1.ItemIndex := DM.employee_msg_1.FieldByName('sex').AsInteger;
      if DM.employee_msg_1.FieldByName('birthday').AsString <> '' then
      begin
        DateTime_SetFormat(DateTimePicker1.Handle,PChar('yyyy-MM-dd'));
        DateTimePicker1.Date := DM.employee_msg_1.FieldByName('birthday').AsDateTime;
        DateTimePicker1.Hint := 'A';
      end
      else
      begin
        DateTime_SetFormat(DateTimePicker1.Handle,'''    -  -  ''');
        DateTimePicker1.Hint := '';
      end;
      if  dm.employee_msg_1departmentid.AsString <>'' then
      with QueryTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:=' SELECT  rkey, departmentname FROM  datadepartment where  rkey = '
          +dm.employee_msg_1departmentid.AsString +#13;
        Open;
        Self.Edit10.Tag :=  FieldByName('rkey').AsInteger;
        Self.Edit10.Text :=   FieldByName('departmentname').AsString;
      end;
      if DM.employee_msg_1.FieldByName('marriage').AsString <> '' then
      ComboBox13.ItemIndex := ComboBox13.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('marriage').AsInteger));
      Edit3.text := DM.employee_msg_1.FieldByName('phone').AsString ;
      Edit4.text := DM.employee_msg_1.FieldByName('IDCard').AsString;
      Edit5.text := DM.employee_msg_1.FieldByName('addr').AsString;
      label55.Caption := dm.employee_msgage.AsString + '岁';
      ComboBox3.text := DM.employee_msg_1.FieldByName('nation').AsString;
      Edit6.text := DM.employee_msg_1.FieldByName('province').AsString;
      if DM.employee_msg_1.FieldByName('education').AsString <> '' then
        ComboBox10.ItemIndex := ComboBox10.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('education').AsInteger));
      if DM.employee_msg_1.FieldByName('Politics_face').AsString <> '' then
        ComboBox12.ItemIndex := ComboBox12.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('Politics_face').AsInteger));
      if DM.employee_msg_1.FieldByName('Position').AsString <> '' then
      begin
        with QueryTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:=' SELECT   rkey, item  FROM  dbo.datadetail WHERE dictid = 1 and  rkey = '
            + DM.employee_msg_1.FieldByName('Position').AsString+#13;
          Open;
          Self.Edit7.Tag :=  FieldByName('rkey').AsInteger;
          Self.Edit7.Text :=   FieldByName('item').AsString;
        end;
      end;
      if DM.employee_msg_1.FieldByName('province_ptr').AsString <> '' then
      begin
        with QueryTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:=' SELECT rkey, memo  FROM  dbo.datadetail WHERE dictid = 19 and  rkey = '
            + DM.employee_msg_1.FieldByName('province_ptr').AsString+#13;
          Open;
          Self.Edit32.Tag :=    FieldByName('rkey').AsInteger;
          Self.Edit32.Text :=   FieldByName('memo').AsString;
        end;
      end;
      if  DM.employee_msg_1.FieldByName('station').AsString <> '' then
      begin
        with QueryTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:=' SELECT   rkey, item  FROM  dbo.datadetail WHERE dictid = 16 and  rkey = '
            + DM.employee_msg_1.FieldByName('station').AsString+#13;
          Open;
          Self.Edit14.Tag :=  FieldByName('rkey').AsInteger;
          Self.Edit14.Text :=   FieldByName('item').AsString;
        end;
      end;
      if DM.employee_msg_1.FieldByName('Rank').AsString <> '' then
        ComboBox7.ItemIndex := ComboBox7.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('Rank').AsInteger));
      if DM.employee_msg_1.FieldByName('employ_type').AsString <> '' then
        ComboBox2.ItemIndex := ComboBox2.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('employ_type').AsInteger));
      if DM.employee_msg_1.FieldByName('source').AsString <> '' then
        ComboBox4.ItemIndex := ComboBox4.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('source').AsInteger));
      if DM.employee_msg_1.FieldByName('ondutytime').AsString <> '' then
      begin
        DateTime_SetFormat(DateTimePicker2.Handle,PChar('yyyy-MM-dd'));
        DateTimePicker2.Date := DM.employee_msg_1.FieldByName('ondutytime').AsDateTime;
        DateTimePicker2.Hint := 'A';
      end
      else
      begin
        DateTime_SetFormat(DateTimePicker2.Handle, '''    -  -  ''');
        DateTimePicker2.Hint := '';
      end;
      if DM.employee_msg_1.FieldByName('outdutytime').AsString <> '' then
      begin
        DateTime_SetFormat(DateTimePicker3.Handle, PChar('yyyy-MM-dd'));
        DateTimePicker3.Date := DM.employee_msg_1.FieldByName('outdutytime').AsDateTime;
        DateTimePicker3.Hint := 'A';
      end
      else
      begin
        DateTime_SetFormat(DateTimePicker3.Handle,'''    -  -  ''');
        DateTimePicker3.Hint := '';
      end;
      Edit9.text := DM.employee_msg_1.FieldByName('others_contacts').AsString;
      if DM.employee_msg_1.FieldByName('attendance').AsString <> '' then
        RadioGroup2.ItemIndex:=DM.employee_msg_1.FieldByName('attendance').AsInteger;
      Edit13.text := DM.employee_msg_1.FieldByName('Cardno').AsString;
      Edit31.Text := DM.employee_msg_1.FieldByName('starLevel').AsString ;
      Edit15.text := DM.employee_msg_1.FieldByName('roomcode').AsString;
      Memo1.Text := DM.employee_msg_1.FieldByName('resume').Value;

      if DM.employee_msg_1.FieldByName('wagetype').AsString <> '' then
      with QueryTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:=' SELECT rkey, Accountname FROM dbo.salaryaccount WHERE rkey = '
          +DM.employee_msg_1.FieldByName('wagetype').AsString +#13;
        Open;
        Edit16.text :=  FieldByName('Accountname').AsString;
        Edit16.Hint :=   FieldByName('rkey').AsString;
      end;
      ComboBox1.text := DM.employee_msg_1.FieldByName('blood_type').AsString;
      Edit12.text    := DM.employee_msg_1.FieldByName('Height').AsString;
      Edit01.Text    := DM.employee_msg_1.FieldByName('graduatedschool').AsString;
      Edit8.Text     := DM.employee_msg_1.FieldByName('majorsubject').AsString;
      Edit27.Text    := DM.employee_msg_1.FieldByName('GraduateTime').AsString;
      Edit11.Text    := DM.employee_msg_1.FieldByName('Residencepermit').AsString;
      Edit28.Text    := DM.employee_msg_1.FieldByName('E_people_relation').AsString;
      Edit29.Text    := DM.employee_msg_1.FieldByName('recognizor').AsString;
      Edit30.Text    := DM.employee_msg_1.FieldByName('recognizor_Phone').AsString;
      Edit31.Text    := DM.employee_msg_1.FieldByName('starlevel').AsString;
      Memo2.Text     := DM.employee_msg_1.fieldByName('remark').AsString;

      if DM.employee_msg_1.FieldByName('iDCardtime').AsString <> '' then
      begin
        DateTime_SetFormat(DateTimePicker4.Handle,PChar('yyyy-MM-dd'));
        DateTimePicker4.DateTime := DM.employee_msg_1.FieldByName('iDCardtime').AsDateTime;
        DateTimePicker4.Hint := 'A';
      end
      else
      begin
        DateTime_SetFormat(DateTimePicker4.Handle,'''    -  -  ''');
        DateTimePicker4.Hint := '';
      end;
      Edit17.Text :=  DM.employee_msg_1.FieldByName('contactpersonaddr').AsString;
      Edit18.Text :=  DM.employee_msg_1.FieldByName('sicardno').AsString;
      Edit33.Text :=  DM.employee_msg_1.FieldByName('siaccountno').AsString;
      Edit34.Text :=  DM.employee_msg_1.FieldByName('public_accumulation_funds').AsString;
      Edit35.Text :=  DM.employee_msg_1.FieldByName('multi_ability').AsString;

      Edit19.Text :=  DM.employee_msg_1.FieldByName('bankaccount').AsString;
      Edit20.Text :=  DM.employee_msg_1.FieldByName('bankname').AsString;
      Edit21.Text :=  DM.employee_msg_1.FieldByName('contactpersonname').AsString;
      Edit22.Text :=  DM.employee_msg_1.FieldByName('contactpersontel').AsString;
      Edit24.Text :=  DM.employee_msg_1.FieldByName('recommendpersonname').AsString;
      Edit25.Text :=  DM.employee_msg_1.FieldByName('recommendpersontel').AsString;
      Edit26.Text :=  DM.employee_msg_1.FieldByName('recommendaddr').AsString;
      Edit23.Text :=  DM.employee_msg_1.FieldByName('recommendworkplace').AsString;
      Edit02.Text :=  DM.employee_msg_1.fieldByName('Languages').AsString;
      DM.ADOEFR.Close;
      DM.ADOEFR.Parameters[0].Value:=DM.employee_msgrkey.Value;
      DM.ADOEFR.Open;
      DM.ADOEFR.First;
      i := 1;
      while not DM.ADOEFR.Eof do
      begin
        SGrid.Cells[0,i] := DM.ADOEFRrelationship.AsString;
        SGrid.Cells[1,i] := DM.ADOEFRchinesename.AsString;
        SGrid.Cells[2,i] := DM.ADOEFRbirth.AsString;
        SGrid.Cells[3,i] := DM.ADOEFRaddr.AsString;
        SGrid.Cells[4,i] := DM.ADOEFRworkplace.AsString;
        SGrid.Cells[5,i] := DM.ADOEFRremark.AsString;
        DM.ADOEFR.Next;
        i := i + 1;
        SGrid.RowCount:= i ;
      end;

      if DM.employee_msg_1.fieldbyname('photo').AsString <> '' then
      begin
        PicStream := tadoblobstream.Create(dm.employee_msg_1photo,bmread);
      try
        Bitmap:=TBitmap.Create;
        try
          Bitmap.LoadFromStream(PicStream);
          Image1.Picture.Graphic:=Bitmap;
        finally
          jpegimage.Free;
        end;
      finally
        PicStream.Free
      end;

      end
      else Image1.Picture.Graphic := nil;
    end
    else
      if Ftag = 4 then
      begin
        DM.employee_msg_1.Close;
        DM.employee_msg_1.Parameters[0].Value:=DM.employee_msgrkey.AsInteger;
        DM.employee_msg_1.Open;
        self.Caption:='员工信息-查看';
        SpeedButton5.Enabled := False;
        BtnSave.Enabled := False;
        Edit1.Text := DM.employee_msg_1.FieldByName('employeecode').AsString ;
        Edit2.Text := DM.employee_msg_1.FieldByName('chinesename').AsString  ;
        RadioGroup1.ItemIndex := DM.employee_msg_1.FieldByName('sex').AsInteger;
        if DM.employee_msg_1.FieldByName('birthday').AsString <> '' then
        begin
          DateTime_SetFormat(DateTimePicker1.Handle,PChar('yyyy-MM-dd'));
          DateTimePicker1.Date := DM.employee_msg_1.FieldByName('birthday').AsDateTime;
          DateTimePicker1.Hint := 'A';
        end
        else
        begin
          DateTime_SetFormat(DateTimePicker1.Handle, '''    -  -  ''');
          DateTimePicker1.Hint := '';
        end;
        if  dm.employee_msg_1departmentid.AsString <> '' then
        with QueryTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:=' SELECT  rkey, departmentname FROM  datadepartment where  rkey = '+dm.employee_msg_1departmentid.AsString +#13;
          Open;
          Self.Edit10.Tag :=  FieldByName('rkey').AsInteger;
          Self.Edit10.Text :=   FieldByName('departmentname').AsString;
        end;
        if DM.employee_msg_1.FieldByName('marriage').AsString <> '' then
        ComboBox13.ItemIndex := ComboBox13.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('marriage').AsInteger));
        Edit3.text := DM.employee_msg_1.FieldByName('phone').AsString ;
        Edit4.text:= DM.employee_msg_1.FieldByName('IDCard').AsString;
        Edit5.text := DM.employee_msg_1.FieldByName('addr').AsString;
        label55.Caption := dm.employee_msgage.AsString + '岁';
        ComboBox3.text := DM.employee_msg_1.FieldByName('nation').AsString;
        Edit6.text := DM.employee_msg_1.FieldByName('province').AsString;
        if DM.employee_msg_1.FieldByName('education').AsString <> '' then
          ComboBox10.ItemIndex := ComboBox10.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('education').AsInteger));
        if DM.employee_msg_1.FieldByName('Politics_face').AsString <> '' then
          ComboBox12.ItemIndex := ComboBox12.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('Politics_face').AsInteger));
        if  DM.employee_msg_1.FieldByName('Position').AsString <> '' then
          Edit7.Text := DM.employee_msg.FieldByName('Positionitem').AsString;
        if  DM.employee_msg_1.FieldByName('province_ptr').AsString <> '' then
          Edit32.Text := DM.employee_msg.FieldByName('prinvicename').AsString;
        if DM.employee_msg_1.FieldByName('station').AsString <> '' then
          Edit14.Text := DM.employee_msg.FieldByName('station').AsString;
        if DM.employee_msg_1.FieldByName('Rank').AsString <> '' then
          ComboBox7.ItemIndex := ComboBox7.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('Rank').AsInteger));
        if DM.employee_msg_1.FieldByName('source').AsString <> '' then
          ComboBox4.ItemIndex := ComboBox4.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('source').AsInteger));
        if DM.employee_msg_1.FieldByName('employ_type').AsString <> '' then
          ComboBox2.ItemIndex := ComboBox2.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('employ_type').AsInteger));
        if DM.employee_msg_1.FieldByName('ondutytime').AsString <> '' then
        begin
          DateTime_SetFormat(DateTimePicker2.Handle,PChar('yyyy-MM-dd'));
          DateTimePicker2.Date :=  DM.employee_msg_1.FieldByName('ondutytime').AsDateTime;
          DateTimePicker2.Hint := 'A';
        end
        else
        begin
          DateTime_SetFormat(DateTimePicker2.Handle,'''    -  -  ''');
          DateTimePicker2.Hint := '';
        end;
        if DM.employee_msg_1.FieldByName('outdutytime').AsString <> '' then
        begin
          DateTime_SetFormat(DateTimePicker3.Handle,PChar('yyyy-MM-dd'));
          DateTimePicker3.Date := DM.employee_msg_1.FieldByName('outdutytime').AsDateTime;
          DateTimePicker3.Hint := 'A';
        end
        else
        begin
          DateTime_SetFormat(DateTimePicker3.Handle,'''    -  -  ''');
          DateTimePicker3.Hint := '';
        end;
        Edit9.text := DM.employee_msg_1.FieldByName('others_contacts').AsString;
        if DM.employee_msg_1.FieldByName('attendance').AsString <> '' then
        RadioGroup2.ItemIndex:=DM.employee_msg_1.FieldByName('attendance').AsInteger;
        Edit13.text := DM.employee_msg_1.FieldByName('Cardno').AsString;
        Edit15.text := DM.employee_msg_1.FieldByName('roomcode').AsString;
        Memo1.Text :=   DM.employee_msg_1.FieldByName('resume').Value;
        if DM.employee_msg_1.FieldByName('wagetype').AsString <> '' then
        with QueryTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:=' SELECT  rkey, Accountname  FROM  dbo.salaryaccount WHERE rkey = '+DM.employee_msg_1.FieldByName('wagetype').AsString +#13;
          Open;
          Edit16.text :=  FieldByName('Accountname').AsString;
          Edit16.Hint :=   FieldByName('rkey').AsString;
        end;

        ComboBox1.text := DM.employee_msg_1.FieldByName('blood_type').AsString;
        Edit12.text    := DM.employee_msg_1.FieldByName('Height').AsString;
        Edit01.Text    := DM.employee_msg_1.FieldByName('graduatedschool').AsString;
        Edit8.Text     := DM.employee_msg_1.FieldByName('majorsubject').AsString;
        Edit27.Text    := DM.employee_msg_1.FieldByName('GraduateTime').AsString;
        Edit11.Text    := DM.employee_msg_1.FieldByName('Residencepermit').AsString;
        Edit28.Text    := DM.employee_msg_1.FieldByName('E_people_relation').AsString;
        Edit29.Text    := DM.employee_msg_1.FieldByName('recognizor').AsString;
        Edit30.Text    := DM.employee_msg_1.FieldByName('recognizor_Phone').AsString;
        Edit31.Text    := DM.employee_msg_1.FieldByName('starlevel').AsString;
        Memo2.Text     := DM.employee_msg_1.fieldByName('remark').AsString;
        if DM.employee_msg_1.FieldByName('iDCardtime').AsString <> '' then
        begin
          DateTime_SetFormat(DateTimePicker4.Handle,PChar('yyyy-MM-dd'));
          DateTimePicker4.Date := DM.employee_msg_1.FieldByName('iDCardtime').AsDateTime;
          DateTimePicker4.Hint := 'A';
        end
        else
        begin
          DateTime_SetFormat(DateTimePicker4.Handle,'''    -  -  ''');
          DateTimePicker4.Hint := '';
        end;
        Edit17.Text :=   DM.employee_msg_1.FieldByName('contactpersonaddr').AsString;
        Edit18.Text :=   DM.employee_msg_1.FieldByName('sicardno').AsString;
        Edit33.Text :=   DM.employee_msg_1.FieldByName('siaccountno').AsString;
        Edit34.Text :=   DM.employee_msg_1.FieldByName('public_accumulation_funds').AsString;
        Edit35.Text :=   DM.employee_msg_1.FieldByName('multi_ability').AsString;

        Edit19.Text  :=  DM.employee_msg_1.FieldByName('bankaccount').AsString;
        Edit20.Text  :=  DM.employee_msg_1.FieldByName('bankname').AsString;
        Edit21.Text  :=  DM.employee_msg_1.FieldByName('contactpersonname').AsString;
        Edit22.Text  :=  DM.employee_msg_1.FieldByName('contactpersontel').AsString;
        Edit24.Text  :=  DM.employee_msg_1.FieldByName('recommendpersonname').AsString;
        Edit25.Text  :=  DM.employee_msg_1.FieldByName('recommendpersontel').AsString;
        Edit26.Text  :=  DM.employee_msg_1.FieldByName('recommendaddr').AsString;
        Edit23.Text  :=  DM.employee_msg_1.FieldByName('recommendworkplace').AsString;
        Edit02.Text  :=  DM.employee_msg_1.fieldByName('Languages').AsString;
        DM.ADOEFR.Close;
        DM.ADOEFR.Parameters[0].Value := DM.employee_msgrkey.Value;
        DM.ADOEFR.Open;
        DM.ADOEFR.First;
        i := 1;
        while not DM.ADOEFR.Eof do
        begin
          SGrid.Cells[0,i]:=DM.ADOEFRrelationship.AsString;
          SGrid.Cells[1,i]:=DM.ADOEFRchinesename.AsString;
          SGrid.Cells[2,i]:=DM.ADOEFRbirth.AsString;
          SGrid.Cells[3,i]:=DM.ADOEFRaddr.AsString;
          SGrid.Cells[4,i]:=DM.ADOEFRworkplace.AsString;
          SGrid.Cells[5,i]:=DM.ADOEFRremark.AsString;
          DM.ADOEFR.Next;
          i := i + 1;
          SGrid.RowCount := i ;
        end;

        if DM.employee_msg_1.fieldbyname('photo').AsString <> '' then
        begin
          PicStream := tadoblobstream.Create(dm.employee_msg_1photo,bmread);
          try
            Bitmap:=TBitmap.Create;
            try
              Bitmap.LoadFromStream(PicStream);
              Image1.Picture.Graphic := Bitmap;
            finally
              jpegimage.Free;
            end;
          finally
            PicStream.Free
          end;
        end
        else Image1.Picture.Graphic := nil;
      end;
  end;
  QueryTmp.Free;
  SGrid.Cells[0,0] := '称呼';
  SGrid.Cells[1,0] := '姓名';
  SGrid.Cells[2,0] := '出身年月';
  SGrid.Cells[3,0] := '现住址';
  SGrid.Cells[4,0] := '工作单位';
  SGrid.Cells[5,0] := '备注';
end;

function JpegStartsInBlob(PicField:TBlobField):integer;
var
  ghy: TADOBlobstream;
  buffer: Word;
  hx: string;
begin
  Result := -1;
  ghy := TADOBlobstream.Create(PicField, bmRead);
  try
    while (Result = -1) and (ghy.Position = 1) do
    begin
      ghy.ReadBuffer(buffer, 1);
      hx := IntToHex(buffer, 2);
    if hx = 'FF' then
    begin
      ghy.ReadBuffer(buffer, 1);
      hx := IntToHex(buffer, 2);
      if hx = 'D8' then Result := ghy.Position - 2
      else if hx = 'FF' then
      ghy.Position := ghy.Position-1;
    end;
    end;
  finally
    ghy.Free
  end;
end;

procedure TDetail_Form.SpeedButton1Click(Sender: TObject);
begin
  QueDep_Form := TQueDep_Form.Create(application);
  if Edit10.Text <> '' then
    QueDep_Form.dep_name := Edit10.Text;
  if (QueDep_Form.ShowModal=mrok)   then
  begin
    Self.Edit10.Tag := QueDep_Form.dep_rkey;
    Self.Edit10.Text := QueDep_Form.dep_name;
  end;
  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey, departmentname, departmentcode, superior, chargename, departmentration, max_overproof_percent,  '
      + 'departmentcount, scarcity from datadepartment where invalid <> 1 and rkey=' + IntToStr(Self.Edit10.Tag);
    Open;
    if FieldByName('departmentcount').AsInteger >=  Round (FieldByName('departmentration').AsInteger * (1 + FieldByName('max_overproof_percent').AsInteger/100)) then
    begin
      ShowMessage('该部门定额人数已满，不能新增人员，请查证！');
      Self.Edit10.Clear;
      Self.Edit10.Tag := 0;
      Exit;
    end;
  end;
end;

procedure TDetail_Form.BtnSaveClick(Sender: TObject);
var
  PicStream : tadoblobstream;
  QueryTmp: TADOQuery;
  tmp1, i,k, LocatRkey : Integer;
  OtherInfo: string;
begin

  if trystrtoint(leftstr(label55.Caption,2),k) then
  begin
  if strtoint (leftstr(label55.Caption,2))<16 then
   begin
    ShowMessage('年龄小于16岁不能录入');
    abort;
   end;
  end;

  if Trim(Edit1.Text) = '' then Label2.Font.Color := clRed  //员工工号
  else Label2.Font.Color := clBlack ;

  if Trim(Edit2.Text) = '' then Label1.Font.Color := clRed  //员工姓名
  else Label1.Font.Color := clBlack ;

  if RadioGroup1.ItemIndex = -1 then Label14.Font.Color := clRed  //性别
  else Label14.Font.Color := clBlack ;

  if Trim(Edit4.Text) = '' then Label17.Font.Color := clRed   //身份证号码
  else Label17.Font.Color := clBlack ;

  if Trim(Edit10.Text) = '' then Label6.Font.Color := clRed  //部门
  else Label6.Font.Color := clBlack ;

  if Trim(Edit7.Text) = '' then Label8.Font.Color := clRed   //职务
  else Label8.Font.Color := clBlack ;

  if DateTimePicker2.Hint = '' then Label11.Font.Color := clRed   //到职日期
  else Label11.Font.Color := clBlack ;

  if (Label1.Font.Color = clRed) or  (Label14.Font.Color= clRed)
  or (Label13.Font.Color = clRed) or (Label17.Font.Color=clRed)
   or (Label6.Font.Color=clRed) or (Label11.Font.Color=clRed)
   or (Label8.Font.Color=clRed)
  then
  begin
    ShowMessage('红色字段为必填项，不能为空，请填写。');
    abort;
  end;

  if idcardisexit_flag  in [0,2] then   IDCardIsExit;//重复录入判断，重复坚持

  if idcardisexit_flag = 2 then exit;

  //     if idcardisexit_flag = 1  时要判断家庭关系数据

  QueryTmp := TADOQuery.Create(Self);
  QueryTmp.Connection := DM.ADOConnection1;
  with QueryTmp do  //新增状态下，检查员工编号是否存在，如果存在，则提示重新输入
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey, employeecode from dbo.employeemsg where  employeecode='''+trim(Edit1.Text)+'''';
    Open;

    if (not IsEmpty) and (Ftag=0) then
    begin
      ShowMessage('此员工编号已存在，请重新输入！');
      Edit1.SetFocus();
      Exit;
    end;

  end;

  if DM.ADOConnection1.Connected then
  begin
    DM.ADOConnection1.BeginTrans;
    if Ftag = 0 then DM.employee_msg_1.Append else DM.employee_msg_1.Edit;
    try
      //相片
      if Image1.Picture.Graphic <> nil then
        begin
          PicStream := tadoblobstream.Create(tblobfield(DM.employee_msg_1.FieldByName('photo')),bmWrite);
          Image1.Picture.Graphic.SaveToStream(PicStream);
          PicStream.Position :=0;
          TBlobField(DM.employee_msg_1.FieldByName('photo')).LoadFromStream(PicStream);
        end
      else DM.employee_msg_1.FieldByName('photo').Value := null;

      DM.employee_msg_1.FieldByName('employeecode').Value := Trim(Edit1.Text);  //员工工号
      DM.employee_msg_1.FieldByName('chinesename').Value := Trim(Edit2.Text);   //员工姓名
      DM.employee_msg_1.FieldByName('sex').AsInteger := RadioGroup1.ItemIndex;  //性别

      //出生日期
      if DateTimePicker1.Hint <> '' then
        DM.employee_msg_1.FieldByName('birthday').AsString := datetostr(DateTimePicker1.Date)
      else  DM.employee_msg_1.FieldByName('birthday').Value := null;

      //婚姻状况
      if  Trim(ComboBox13.text) <> '' then
      DM.employee_msg_1.FieldByName('marriage').AsInteger := Integer(ComboBox13.Items.Objects[ComboBox13.itemindex]);

      DM.employee_msg_1.FieldByName('phone').Value := Trim(Edit3.text);   //联系电话
      DM.employee_msg_1.FieldByName('IDCard').Value := Trim(Edit4.text);  //身份证号码
      DM.employee_msg_1.FieldByName('addr').Value := Trim(Edit5.text);    //身份证地址
      DM.employee_msg_1.FieldByName('nation').Value := Trim(ComboBox3.Text); //民族
      DM.employee_msg_1.FieldByName('province').Value := Trim(Edit6.text);  //省份

      //文化程度
      if  Trim(ComboBox10.text) <> '' then
      DM.employee_msg_1.FieldByName('education').AsInteger := Integer(ComboBox10.Items.Objects[ComboBox10.itemindex]);
      //政治面貌
      if  Trim(ComboBox12.text) <> '' then
      DM.employee_msg_1.FieldByName('Politics_face').Value := Integer(ComboBox12.Items.Objects[ComboBox12.itemindex]);
      //到职日期
      if DateTimePicker2.Hint <> '' then
          DM.employee_msg_1.FieldByName('ondutytime').Value := DateToStr(DateTimePicker2.Date)
      else  DM.employee_msg_1.FieldByName('ondutytime').Value := null;
      //离职日期
      if DateTimePicker3.Hint <> '' then
          DM.employee_msg_1.FieldByName('outdutytime').Value := DateToStr(DateTimePicker3.Date)
      else  DM.employee_msg_1.FieldByName('outdutytime').Value := null;

      DM.employee_msg_1.FieldByName('others_contacts').Value := Trim(Edit9.text);   //第二联系电话
      if Edit10.Text <> '' then DM.employee_msg_1.FieldByName('departmentid').AsInteger := Edit10.Tag;  //部门
      if Trim(Edit7.text) <> '' then DM.employee_msg_1.FieldByName('Position').AsInteger := Edit7.Tag;  //职务
      if Trim(Edit14.text) <> '' then DM.employee_msg_1.FieldByName('station').AsInteger := Edit14.Tag;  //岗位
      if Trim(Edit32.text) <> '' then DM.employee_msg_1.FieldByName('province_ptr').AsInteger := Edit32.Tag;  //籍贯
      if Trim(ComboBox7.text) <> '' then DM.employee_msg_1.FieldByName('Rank').AsInteger := Integer(ComboBox7.Items.Objects[ComboBox7.itemindex]);  //职级
      if Trim(ComboBox2.text) <> '' then DM.employee_msg_1.FieldByName('employ_type').AsInteger := Integer(ComboBox2.Items.Objects[ComboBox2.itemindex]); //合同类型
      if Trim(ComboBox4.text) <> '' then DM.employee_msg_1.FieldByName('source').AsInteger := Integer(ComboBox4.Items.Objects[ComboBox4.itemindex]); //录用来源
      if RadioGroup2.ItemIndex <> -1 then DM.employee_msg_1.FieldByName('attendance').AsInteger := RadioGroup2.ItemIndex;  //是否考勤
      DM.employee_msg_1.FieldByName('Cardno').Value := Trim(Edit13.text);     //考勤卡号
      DM.employee_msg_1.FieldByName('roomcode').Value := Trim(Edit15.text);   //床位编号
      if Trim(Edit16.Hint)<> '' then DM.employee_msg_1.FieldByName('wagetype').Value := Trim(Edit16.Hint);  //帐套类型
      if Trim(Edit31.text) <> '' then DM.employee_msg_1.FieldByName('starLevel').AsInteger := StrToInt(Edit31.Text);  //星级
      if Trim(Edit31.text) = '' then DM.employee_msg_1.FieldByName('starLevel').Value := NULL;  //星级

      DM.employee_msg_1.FieldByName('resume').Value := Memo1.text; //履历
      DM.employee_msg_1.FieldByName('blood_type').Value := ComboBox1.text;  //血型
      if Trim(Edit12.Text) <> '' then
        DM.employee_msg_1.FieldByName('Height').Value := StrToInt(trim(Edit12.text));  //身高
      DM.employee_msg_1.FieldByName('graduatedschool').Value := Edit01.Text;  //毕业院校
      DM.employee_msg_1.FieldByName('majorsubject').Value := Edit8.Text;     //专业
      if Trim(Edit27.Text) <> '' then
        DM.employee_msg_1.FieldByName('GraduateTime').Value := Edit27.Text;       //毕业时间
      DM.employee_msg_1.FieldByName('Residencepermit').Value := Edit11.Text;    //居住证
      if DateToStr(DateTimePicker4.Date) <> '    -  -  ' then
        DM.employee_msg_1.FieldByName('iDCardtime').AsString := DateToStr(DateTimePicker4.Date);  //身份证有效期
      DM.employee_msg_1.FieldByName('contactpersonaddr').Value := Edit17.Text;  //紧急联络人住址
      DM.employee_msg_1.FieldByName('E_people_relation').Value := Edit28.Text;  //紧急联络人关系
      DM.employee_msg_1.FieldByName('recognizor').Value := Edit29.Text;         //担保人姓名
      DM.employee_msg_1.FieldByName('recognizor_Phone').Value := Edit30.Text; //担保人联系方式
      DM.employee_msg_1.FieldByName('sicardno').Value := Edit18.Text;     //社保号
      DM.employee_msg_1.FieldByName('siaccountno').Value := Edit33.Text;          //社会保障卡帐号
      DM.employee_msg_1.FieldByName('public_accumulation_funds').Value := Edit34.Text;//      公积金帐号
      DM.employee_msg_1.FieldByName('multi_ability').Value := Edit35.Text; // 岗位技能

      DM.employee_msg_1.FieldByName('bankaccount').Value := Edit19.Text;
      DM.employee_msg_1.FieldByName('bankname').Value := Edit20.Text;
      DM.employee_msg_1.FieldByName('contactpersonname').Value := Edit21.Text;
      DM.employee_msg_1.FieldByName('contactpersontel').Value := Edit22.Text;
      DM.employee_msg_1.FieldByName('recommendpersonname').Value := Edit24.Text;
      DM.employee_msg_1.FieldByName('recommendpersontel').Value := Edit25.Text;
      DM.employee_msg_1.FieldByName('recommendaddr').Value := Edit26.Text;
      DM.employee_msg_1.FieldByName('recommendworkplace').Value := Edit23.Text;
      DM.employee_msg_1.FieldByName('Languages').Value := Edit02.Text;
      DM.employee_msg_1.FieldByName('remark').Value := Memo2.Text;
      
      if idcardisexit_flag=1 then
      DM.employee_msg_1.FieldByName('frist_RKEY').Value:=idcardisexit_firstrkey;
      //新增员工的第一个rkey
      DM.employee_msg_1.UpdateBatch(arAll);
      //获取本次新增员工信息rkey的值
      Frkeymsg := DM.employee_msg_1.FieldByName('rkey').asinteger;

     //员工家庭关系
      DM.ADOEFR.Close;
      DM.ADOEFR.Parameters[0].Value := Frkeymsg; //DM.employee_msgrkey.Value;
      DM.ADOEFR.Open;
      while not DM.ADOEFR.IsEmpty do
      DM.ADOEFR.Delete;

      for i := 1 to SGrid.RowCount - 1 do
      begin
        DM.ADOEFR.Append;
        DM.ADOEFR.FieldByName('employeeid').Value := Frkeymsg;      //DM.employee_msgrkey.Value;
        DM.ADOEFR.FieldByName('relationship').Value := SGrid.Cells[0,i];
        DM.ADOEFR.FieldByName('chinesename').Value := SGrid.Cells[1,i];
        DM.ADOEFR.FieldByName('birth').Value := SGrid.Cells[2,i];
        DM.ADOEFR.FieldByName('addr').Value := SGrid.Cells[3,i];
        DM.ADOEFR.FieldByName('workplace').Value := SGrid.Cells[4,i];
        DM.ADOEFR.FieldByName('remark').AsString := SGrid.Cells[5,i];
        with QueryTmp do
        begin
          close;
          sql.Text:='select getdate() as sys_date';
          open;
          DM.ADOEFR.FieldByName('inputdate').AsString  := fieldvalues['sys_date'];
        end;
        if user_ptr <> '' then
        DM.ADOEFR.FieldByName('opration_person').AsInteger  := StrToInt(UMain.Main_Form.UserRkey);
      end;
      DM.ADOEFR.UpdateBatch(arAll);
     //员工家庭关系

      if Ftag=0 then
      begin
        if trim(ComboBox2.Text) = '正式合同' then
        begin
          with DM.tmp do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'insert into dbo.employee_contract values('+quotedStr(Edit1.Text)+','
              + IntToStr(Frkeymsg) +','
              + QuotedStr(DateToStr(DateTimePicker2.Date)) + ','                 //合同开始日期  当天日期
              + QuotedStr(DateToStr(IncMonth(DateTimePicker2.Date, +3) -1)) +','    //试用期满日期
              + QuotedStr(DateToStr(IncYear(DateTimePicker2.Date, +3) -1)) +     //合同结束日期
              ', '+inttostr(contract_rkey)+', '
              + QuotedStr(DateToStr(Now())) + ',' + UMain.Main_Form.UserRkey + ',1,'' '' )';
            ExecSQL;
          end;
        end;
      end;
      DM.ADOConnection1.CommitTrans;

      if Ftag = 0 then LocatRkey := Frkeymsg;

      if Ftag = 1 then LocatRkey := DM.employee_msgrkey.Value;

      DM.employee_msg.Requery();
      DM.employee_msg.Locate('rkey', LocatRkey, []);

      //如果是新增操作
      if Ftag=0 then
      begin
        if (Application.MessageBox('该记录已保存成功，是否继续操作?', PChar('提示'),MB_YESNO)=6) then
        begin
          for i:= 0 to ComponentCount - 1 do
          begin
            if (Self.Components[i] is TEdit) and (TEdit(Components[i]).Name <> 'Edit7') then
            begin
              TEdit(Components[i]).Clear;
            end;
          end;

          with DM.tmp do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'select top 1 * from employeemsg  where status=1  '
              + ' and employeecode not like ''ST%'' order by cast(employeecode as int) desc ';
            Open;
            Label47.Caption := FieldByname('employeecode').AsString;
          end;

          self.Caption:='员工信息-新增';
          Memo1.Text := '点此开始编写履历内容.......';
          Memo1.Font.Color := cl3DDkShadow;
          Image1.Picture.Graphic := nil;
          for i:=1 to SGrid.RowCount-1 do SGrid.Rows[i].Clear;
          SGrid.RowCount := 2;
          SGrid.Col := 0;
          idcardisexit_flag :=0;
          DateTimePicker1.Format := '    -  -  ';
          DateTimePicker4.Format := '    -  -  ';
          ComboBox1.Text := '';
          ComboBox2.Text := '';
          ComboBox3.Text := '';
          ComboBox10.Text := '';
          ComboBox12.Text := '';
          ComboBox13.ItemIndex := -1;
          Label1.Font.Color := clRed;

          Label14.Font.Color:= clRed;
          Label2.Font.Color := clRed;
          Label17.Font.Color := clRed;
          Label6.Font.Color := clRed;
          Label11.Font.Color := clRed;
          Label8.Font.Color := clRed;
          PageControl1.ActivePage := TabSheet1;
        end
        else
        begin
          FimilyTag := 1;
          ModalResult := mrOk;
        end;
      end
      else
      begin
        FimilyTag := 1;
        modalresult := mrok;
      end;
    except on e:Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        ShowMessage('保存过程中出现错误！'+#13+'出错原因：'+e.Message);
        Exit;
      end;
    end;
  end;
  QueryTmp.Free;
  Main_Form.Label3.Caption := IntToStr(dM.employee_msg.RecordCount);
end;

procedure TDetail_Form.Image1Click(Sender: TObject);
var
  JpgFile:TjpegImage;
  MyBmp: TBitmap;
  filepath: string;
begin
  filepath := ExtractFilePath(application.ExeName);
  if openPictureDialog1.Execute then
  begin
    if trim(OpenPictureDialog1.filename)= '' then exit;
    try
      JpgFile:=TjpegImage.create;
      MyBmp:=TBitmap.create;
      JpgFile.LoadFromFile(OpenPictureDialog1.filename);
      MyBmp.Assign(JpgFile);
      MyBmp.SaveToFile(filepath + 'temp.bmp');
    finally
      MyBmp.free;
      JpgFile.Free;
    end;
    image1.Picture:=nil;
    image1.picture.LoadFromFile(filepath + 'temp.bmp');
  end;
  DeleteFile(ExtractFileDir(OpenPictureDialog1.FileName)+'zp.bmp');
end;

procedure TDetail_Form.N1Click(Sender: TObject);
begin
  image1.Picture.Graphic:=nil;
end;

procedure TDetail_Form.BitBtn1Click(Sender: TObject);  //读身份证阅读
var
  iRet : integer;
  szName:Array[0..NameLen] of char;
  szSex:Array[0..SexLen] of char;
  szNation:Array[0..NationLen] of char;
  szBirthday:Array[0..DateLen] of char;
  szAddress:Array[0..AddrLen] of char;
  szID:Array[0..IdLen] of char;
  szDepartment:Array[0..DepartmentLen] of char;
  szStartDate:Array[0..DateLen] of char;
  szEndDate:Array[0..DateLen] of char;
  BMP:TBitmap;
  JPG:TJpegImage;
  JPGFile:string;
  outSzDate: TDateTime;
begin
  Edit4.SetFocus();
  if (Edit2.Text <> '') or (Edit4.Text <> '')
  or (Edit5.Text <> '') or(Edit6.Text <> '')
  or (RadioGroup1.ItemIndex <> -1) or (ComboBox3.Text <> '')
  or (DateTimePicker1.Hint <> '') or (DateTimePicker4.Hint <> '')
  then
  begin
    Edit2.Text := '';
    Edit4.Text := '';
    Edit5.Text := '';
    image1.Picture.Assign(nil);
    FillChar(szName, sizeof(szName), 0);
    m_szDllPath := ExtractFilePath(application.ExeName);
    iRet := InitComm1(strToint('1001'), strToint('115200'));

    if  (Application.MessageBox('从身份证读取后，一些已填写的资料将被新内容替换，是否继续?', PChar('提示'),MB_YESNO)=6) then
    begin
      if iRet <> 1 then
      begin
        ShowMessage('打开端口失败，请与管理员联系');
        exit;
      end;
      Authenticate();
      iRet := Read_Content(1);
      if iRet <> 1 then
      begin
        ShowMessage('读卡失败，请查看设备是否正常运行');
        CloseComm();
        exit;
      end;
      iRet := GetPeopleName(szName,sizeof(szName));
      iRet := GetPeopleSex(szSex,sizeof(szSex));
      iRet := GetPeopleNation(szNation,sizeof(szNation));
      iRet := GetPeopleBirthday(szBirthday,sizeof(szBirthday));
      iRet := GetPeopleAddress(szAddress,sizeof(szAddress));
      iRet := GetPeopleIDCode(szID,sizeof(szID));
      iRet := GetDepartment(szDepartment,sizeof(szDepartment));
      iRet := GetStartDate(szStartDate,sizeof(szStartDate));
      iRet := GetEndDate(szEndDate,sizeof(szEndDate));
      CloseComm();
      if iRet = 0 then
      begin
        ShowMessage('获取卡信息失败，请查看卡是否放置正确，或查看设备是否正常运行');
        exit;
      end;
      Edit2.Text := szName;
      if szSex = '男' then RadioGroup1.ItemIndex:= 1
      else RadioGroup1.ItemIndex:= 0;
      DateTime_SetFormat(DateTimePicker1.Handle,PChar('yyyy-MM-dd'));
      DateTimePicker1.Date := StrToDate(Format('%s-%s-%s', [copy(szBirthday,1,4), copy(szBirthday, 5, 2), copy(szBirthday, 7,2)]));
      DateTimePicker1.Hint := 'A';
      Edit4.Text := szID;
      Edit5.Text := szAddress;
      Edit6.Text := LeftStr(szAddress, 6);
      ComboBox3.Text := szNation+'族';
      if not FileExists(m_szDllPath+'zp.bmp') then
      begin
        Application.MessageBox('文件不存在，请重新读取', '错误', mb_iconerror);
        Exit;
      end;
      image1.Picture.LoadFromFile(m_szDllPath+'zp.bmp');
      DeleteFile(m_szDllPath+'\zp.bmp');
      DateTimePicker4.Date := StrToDate(Format('%s-%s-%s', [copy(szEndDate,1,4), copy(szEndDate, 5, 2), copy(szEndDate, 7,2)]));
      DateTimePicker4.Hint := 'A';
    end;
  end
  else
  begin
    Edit2.Text := '';
    Edit4.Text := '';
    Edit5.Text := '';
    image1.Picture.Assign(nil);
    FillChar(szName,sizeof(szName),0);
    m_szDllPath := ExtractFilePath(application.ExeName);
    iRet := InitComm1(strToint('1001'),strToint('115200'));
    if iRet <> 1 then
    begin
      ShowMessage('打开端口失败，请与管理员联系');
      exit;
    end;
    Authenticate();
    iRet := Read_Content(1);
    if iRet <> 1 then
    begin
      ShowMessage('读卡失败，请查看设备是否正常运行');
      CloseComm();
      exit;
    end;
    iRet := GetPeopleName(szName,sizeof(szName));
    iRet := GetPeopleSex(szSex,sizeof(szSex));
    iRet := GetPeopleNation(szNation,sizeof(szNation));
    iRet := GetPeopleBirthday(szBirthday,sizeof(szBirthday));
    iRet := GetPeopleAddress(szAddress,sizeof(szAddress));
    iRet := GetPeopleIDCode(szID,sizeof(szID));
    iRet := GetDepartment(szDepartment,sizeof(szDepartment));
    iRet := GetStartDate(szStartDate,sizeof(szStartDate));
    iRet := GetEndDate(szEndDate,sizeof(szEndDate));
    CloseComm();
    if iRet = 0 then
    begin
      ShowMessage('获取卡信息失败，请查看卡是否放置正确，或查看设备是否正常运行');
      exit;
    end;

    Edit2.Text := szName;
    if szSex = '男' then RadioGroup1.ItemIndex:= 1
    else RadioGroup1.ItemIndex:= 0;
    DateTime_SetFormat(DateTimePicker1.Handle,PChar('yyyy-MM-dd'));
    DateTimePicker1.Date := StrToDate(Format('%s-%s-%s', [copy(szBirthday,1,4), copy(szBirthday, 5, 2), copy(szBirthday, 7,2)]));
    DateTimePicker1.Hint := 'A';
    Edit4.Text := szID;
    
    Edit5.Text := szAddress;
    Edit6.Text := LeftStr(szAddress,3);
    ComboBox3.Text := szNation+'族';

    if not FileExists(m_szDllPath+'zp.bmp') then
    begin
       Application.MessageBox('文件不存在，请重新读取','错误',mb_iconerror);
       Exit;
    end;
    image1.Picture.LoadFromFile(m_szDllPath+'zp.bmp');
    DeleteFile(m_szDllPath+'\zp.bmp');
    DateTimePicker4.Date := StrToDate(Format('%s-%s-%s', [copy(szEndDate,1,4), copy(szEndDate, 5, 2), copy(szEndDate, 7,2)]));
    DateTimePicker4.Hint := 'A';
  end;
  IDCardIsExit; //看看是否重复身份证
end;

procedure TDetail_Form.IDCardIsExit();
var
  epcode, epname: string;
  i: Integer;
  outdutydate: pansichar;
begin
  idcardisexit_flag := 0;
  if Trim(Edit4.Text) = '' then Exit;
  with DM.tmp do  //检查身份证号码是否存在
  begin
    if Ftag = 0 then
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select top 1 * from dbo.employeemsg where IDCard='''
      + trim(Edit4.Text) + ''' order by rkey desc ';
      Open;
      // 3种情况
      if FieldValues['status'] = 1 then
      begin
        ShowMessage('该身份证号为在职人员身份证号' + #13
          + '工号：'+ FieldValues['employeecode'] + ', 姓名: '
          + FieldValues['chinesename'] + #13
          + '操作失败，请重新输入身份证号！');
        Edit4.Clear;
        Edit4.SetFocus;
        Exit;
      end
      else
      begin
        if not IsEmpty then
        begin
          outdutydate := PAnsiChar(formatdatetime('YYYY-MM-DD',FieldByName('outdutytime').Value));
          if ( Application.MessageBox( PAnsiChar(' 该身份证号为为离职人员身份证号，'+ #13+outdutydate+ ' 如果离职超过1个月，建议到离职档案程序内去做复工，'+#13+  ' 如果离职未超过1个月，确定需要另立档案请点击 [是] '), PChar('提示'),MB_YESNO)= 6)
          then
                begin
                   with DM.tmp1 do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Text := 'select top 1 rkey from employeemsg where IDCard='
                        +QuotedStr(trim(Edit4.Text));
                      Open;
                    if not IsEmpty then
                      begin
                        idcardisexit_firstrkey:= FieldValues['rkey'];
                      end;
                      Close;
                      SQL.Clear;
                      SQL.Text := 'select * from datadetail where item= '
                      + QuotedStr(LeftStr(Edit4.Text, 6));
                        Open;
                    if not IsEmpty then
                      begin
                        Edit32.Tag := FieldValues['rkey'];
                        Edit32.Text := FieldValues['memo'];
                      end;
                      end;
            idcardisexit_flag := 1;//身份证重复，并且重新录入信息

            DateTime_SetFormat(DateTimePicker1.Handle,PChar('yyyy-MM-dd'));
            DateTime_SetFormat(DateTimePicker4.Handle,PChar('yyyy-MM-dd'));
            Edit2.Text := FieldValues['chinesename'];                               //姓名
            RadioGroup1.ItemIndex := FieldValues['sex'];
            if not FieldByName('birthday').IsNull then                           //性别
            DateTimePicker1.Date := StrToDate(Copy(FieldByName('birthday').AsString, 0, 10));
            //出生日期
            ComboBox13.ItemIndex := ComboBox13.Items.IndexOfObject(TObject(FieldByName('marriage').AsInteger)); //婚否
            if not FieldByName('phone').IsNull then Edit3.Text := FieldValues['phone'];                         //联系电话
            if not FieldByName('others_contacts').IsNull then Edit9.Text := FieldValues['others_contacts'];     //第二联系电话
            if not FieldByName('iDCardtime').IsNull then DateTimePicker4.Date := FieldValues['iDCardtime'];  //身份证有效期
            if not FieldByName('addr').IsNull then Edit5.Text := FieldValues['addr'];                        //身份证地址
            if not FieldByName('nation').IsNull then ComboBox3.Text := FieldValues['nation'];                    //民族
            if not FieldByName('province').IsNull then Edit6.Text := FieldValues['province'];                //籍贯
            if FieldByName('education').AsString <> '' then
              ComboBox10.ItemIndex := ComboBox10.Items.IndexOfObject(TObject(FieldByName('education').AsInteger));     //文化程度
            if FieldByName('Politics_face').AsString <> '' then
              ComboBox12.ItemIndex := ComboBox12.Items.IndexOfObject(TObject(FieldByName('Politics_face').AsInteger)); //政治面貌
            if not FieldByName('graduatedschool').IsNull then edit01.Text := FieldValues['graduatedschool']; //毕业院校
            if not FieldByName('majorsubject').IsNull then edit8.Text := FieldValues['majorsubject'];        //专业
            if not FieldByName('GraduateTime').IsNull then edit27.Text := FieldValues['GraduateTime'];       //毕业时间
            if not FieldByName('Languages').IsNull then edit02.Text := FieldValues['Languages'];             //语种
            if not FieldByName('sicardno').IsNull then edit18.Text := FieldValues['sicardno'];                       //社保电脑号
            if not FieldByName('siaccountno').IsNull then edit33.Text := FieldValues['siaccountno'];                //社保卡账号
            if not FieldByName('public_accumulation_funds').IsNull then edit34.Text := FieldValues['public_accumulation_funds'];   //公积金卡帐号
            if not FieldByName('multi_ability').IsNull then edit35.Text := FieldValues['multi_ability'];   //岗位技能

            if not FieldByName('contactpersonname').IsNull then edit21.Text := FieldValues['contactpersonname'];     //紧急联络人姓名
            if not FieldByName('contactpersontel').IsNull then edit22.Text := FieldValues['contactpersontel'];       //紧急联络人电话
            if not FieldByName('contactpersonaddr').IsNull then edit17.Text := FieldValues['contactpersonaddr'];     //紧急联络人住址
            if not FieldByName('E_people_relation').IsNull then edit28.Text := FieldValues['E_people_relation'];     //紧急联络人关系
            if not FieldByName('recommendpersonname').IsNull then edit24.Text := FieldValues['recommendpersonname']; //推荐人姓名
            if not FieldByName('recommendpersontel').IsNull then edit25.Text := FieldValues['recommendpersontel'];   //推荐人电话
            if not FieldByName('recommendaddr').IsNull then edit26.Text := FieldValues['recommendaddr'];             //推荐人住址
            if not FieldByName('recommendworkplace').IsNull then edit23.Text := FieldValues['recommendworkplace'];   //推荐人工作单位
            if not FieldByName('Residencepermit').IsNull then edit11.Text := FieldValues['Residencepermit'];         //居住证
            if not FieldByName('recognizor_Phone').IsNull then edit30.Text := FieldValues['recognizor_Phone'];       //担保人联系电话
            if not FieldByName('recognizor').IsNull then edit29.Text := FieldValues['recognizor'];                   //担保人姓名
            if not FieldByName('Height').IsNull then edit12.Text := FieldValues['Height'];                           //身高
            if not FieldByName('bankaccount').IsNull then edit19.Text := FieldValues['bankaccount'];                 //银行卡号
            if not FieldByName('bankname').IsNull then edit20.Text := FieldValues['bankname'];                       //银行名称
            if not FieldByName('resume').IsNull then Memo1.Text := FieldValues['resume'];                                    //履历

            with DM.tmp1 do
            begin
              Close;
              SQL.Clear;
              SQL.Text := 'select * from employeeFamilyrelationship where employeeid= '
                + IntToStr(DM.tmp.FieldValues['rkey']);
              Open;
              if not IsEmpty then
              begin
                First;
                i := 1;
                while not Eof do
                begin
                  if not FieldByName('relationship').IsNull then SGrid.Cells[0,i] := FieldByName('relationship').AsString;
                  if not FieldByName('chinesename').IsNull then SGrid.Cells[1,i] := FieldByName('chinesename').AsString;
                  if not FieldByName('birth').IsNull then SGrid.Cells[2,i] := FieldByName('birth').AsString;
                  if not FieldByName('addr').IsNull then SGrid.Cells[3,i] := FieldByName('addr').AsString;
                  if not FieldByName('workplace').IsNull then SGrid.Cells[4,i] := FieldByName('workplace').AsString;
                  if not FieldByName('remark').IsNull then SGrid.Cells[5,i] := FieldByName('remark').AsString;
                  Next;
                  i := i + 1;
                  SGrid.RowCount:= i ;
                end;
              end;
            end;
          end
          else   idcardisexit_flag := 2 ;
          Edit1.SetFocus;
        end;
      end;
    end;
  end;

  end;

procedure TDetail_Form.FormShow(Sender: TObject);
begin
  PageControl1.TabIndex := 0;
  if trim(Memo1.Text) = '点此开始编写履历内容.......' then Memo1.Font.Color := cl3DDkShadow
  else Memo1.Font.Color := clBlack;
end;

procedure TDetail_Form.Memo1Click(Sender: TObject);
begin
  if trim(Memo1.Text) = '点此开始编写履历内容.......' then
  begin
    Memo1.Text := '';
    Memo1.Font.Color := clBlack;
  end;
end;

procedure TDetail_Form.DateTimePicker1Change(Sender: TObject);
var  f_ages :real;
begin
  DateTime_SetFormat(DateTimePicker1.Handle,PChar('yyyy-MM-dd'));
  DateTimePicker1.Hint := 'A';
  f_ages :=trunc(MonthsBetween(incday(now,1),datetimepicker1.Date)/12.0);
  // showmessage('月差'+inttostr(MonthsBetween(now,datetimepicker1.Date)));
 // showmessage(inttostr(MonthsBetween(now,datetimepicker1.Date) mod 12));
 // showmessage(inttostr(dayof(now)));
 // showmessage('生日'+inttostr(dayof(datetimepicker1.Date)));
  if MonthsBetween(incday(now,1),datetimepicker1.Date) mod 12 = 0
  then
  begin
    if dayof(datetimepicker1.Date)<= dayof(now)   then f_ages := f_ages+0.00
    else f_ages := f_ages-1+0.11;
  end
   else
  begin
     f_ages :=  f_ages +  (MonthsBetween(now,datetimepicker1.Date) mod 12 )/100;
   end;
 // showmessage( formatfloat('0.00',f_ages))  ;
  label55.Caption := formatfloat('0.00',f_ages)+'岁';
end;

procedure TDetail_Form.DateTimePicker3Change(Sender: TObject);
begin
  DateTime_SetFormat(DateTimePicker3.Handle,PChar('yyyy-MM-dd'));
  DateTimePicker3.Hint := 'A';
end;

procedure TDetail_Form.DateTimePicker2Change(Sender: TObject);
begin
  DateTime_SetFormat(DateTimePicker2.Handle,PChar('yyyy-MM-dd'));
  DateTimePicker2.Hint := 'A';
end;

procedure TDetail_Form.Button1Click(Sender: TObject);
var i:Integer;
begin
   i := Application.MessageBox('已有员工使用此编号，是否继续?', PChar('提示'),MB_YESNO);
end;

procedure TDetail_Form.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [ '0'..'9',#8,chr(VK_delete)]) then key:=char(0);
end;

procedure TDetail_Form.Edit13KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key =#13 ) then key := char(0);
end;

procedure TDetail_Form.SpeedButton2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'Accountname/帐套名称/80,discription/描述/80,'
    + 'remark/备注/180';
  InputVar.Sqlstr := 'SELECT rkey, Accountname, discription, remark ' + #13
    + 'FROM dbo.salaryaccount'+#13;
  try
  inputvar.KeyField :='rkey';
  InputVar.AdoConn := dm.ADOConnection1;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    edit16.Text := trim(frmPick_Item_Single.adsPick.FieldValues['Accountname']);
    edit16.Hint := trim(frmPick_Item_Single.adsPick.FieldValues['rkey']);
  end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TDetail_Form.SGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
  var
  R:TRect;
begin
  if (ACol = 6) then
  begin
    SGrid.Options:=SGrid.Options-[goEditing];
    if (ARow = Self.SGrid.RowCount-1) then
    begin
      SGrid.Cells[6,0]:='新增';
      SpeedButton4.Visible := False;
      SpeedButton3.Visible := CanSelect;
      if not CanSelect then Exit;
      SpeedButton3.Parent := SGrid;
      R := SGrid.CellRect(ACol, ARow);
      SpeedButton3.BoundsRect := R;
      SpeedButton3.Width := SpeedButton3.Height;
      SpeedButton3.Left  := R.Right - SpeedButton3.Width;
    end
    else if (ARow < Self.SGrid.RowCount-1) then
    begin
      SGrid.Cells[6,0]:='删除';
      SpeedButton3.Visible := False;
      SpeedButton4.Visible := CanSelect;
      if not CanSelect then Exit;
      SpeedButton4.Parent := SGrid;
      R := SGrid.CellRect(ACol, ARow);
      SpeedButton4.BoundsRect := R;
      SpeedButton4.Width := SpeedButton4.Height;
      SpeedButton4.Left  := R.Right - SpeedButton4.Width;
    end;
  end
  else
  begin
    SGrid.Options:=SGrid.Options+[goEditing];
    SpeedButton3.Visible := False;
    SpeedButton4.Visible := False;
  end;
end;

procedure TDetail_Form.SpeedButton3Click(Sender: TObject);
begin
   SGrid.RowCount := SGrid.RowCount + 1;
   Self.SpeedButton3.Visible:=False;
end;

procedure TDetail_Form.SpeedButton4Click(Sender: TObject);
var
 i:byte;
begin
  if (sgrid.RowCount = 2) then sgrid.Rows[1].Clear;
  if (sgrid.RowCount <= 2) or (sgrid.Row=sgrid.RowCount-1) then exit;
  for i:=sgrid.Row to sgrid.RowCount-1 do sgrid.Rows[i].Text:=sgrid.Rows[i+1].Text;
  sgrid.RowCount:=sgrid.RowCount-1;
end;

procedure TDetail_Form.SGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var 
  s: String;
  R: TRect; 
begin 
  if (ARow = 0) then
  begin
    with   SGrid   do
    begin
      Canvas.FillRect(Rect);
      S   :=   Cells[ACol,ARow];
      R   :=   Rect;
      DrawText(Canvas.Handle, PChar(s), Length(s), r, DT_CENTER or DT_SINGLELINE or DT_VCENTER);     //文字居中
    end;
  end;
end;

procedure TDetail_Form.SpeedButton5Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'item/职务名称/500';
  InputVar.Sqlstr := 'SELECT rkey, dictid, item FROM dbo.datadetail WHERE dictid = 1 ' + #13;
  try
    inputvar.KeyField :='rkey';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit7.Text := trim(frmPick_Item_Single.adsPick.FieldValues['item']);
      Edit7.Tag := StrToInt(trim(frmPick_Item_Single.adsPick.FieldValues['rkey']));
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TDetail_Form.Edit7Exit(Sender: TObject);
begin
  if Edit7.Text = '' then Edit7.Tag := -1;
end;

procedure TDetail_Form.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TDetail_Form.Edit19KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TDetail_Form.Edit25KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TDetail_Form.Edit22KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

procedure TDetail_Form.DateTimePicker4Change(Sender: TObject);
begin
  DateTime_SetFormat(DateTimePicker4.Handle,PChar('yyyy-MM-dd'));
  DateTimePicker4.Hint := 'A';
end;

procedure TDetail_Form.N4Click(Sender: TObject);
var
  i: byte;
begin
  for i:=1 to sgrid.RowCount-1 do sgrid.Rows[i].Clear;
  sgrid.RowCount:=2;
end;

procedure TDetail_Form.SpeedButton6Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'item/岗位名称/400';
  InputVar.Sqlstr :=
  'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 16 '+#13;
  try
    inputvar.KeyField :='rkey';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit14.Text := trim(frmPick_Item_Single.adsPick.FieldValues['item']);
      Edit14.Tag := StrToInt(trim(frmPick_Item_Single.adsPick.FieldValues['rkey']));
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TDetail_Form.Edit31Change(Sender: TObject);
begin
  try
    if Trim(Edit31.Text) <> '' then
    begin
      if StrToInt(Edit31.Text) > 8 then
      begin
        ShowMessage('员工星级最多8星，请重新输入！');
        Edit31.Clear;
        Exit;
      end;
      case StrToInt(Edit31.Text) of
        1 : Label52.Caption := '★☆☆☆☆☆☆☆';
        2 : Label52.Caption := '★★☆☆☆☆☆☆';
        3 : Label52.Caption := '★★★☆☆☆☆☆';
        4 : Label52.Caption := '★★★★☆☆☆☆';
        5 : Label52.Caption := '★★★★★☆☆☆';
        6 : Label52.Caption := '★★★★★★☆☆';
        7 : Label52.Caption := '★★★★★★★☆';
        8 : Label52.Caption := '★★★★★★★★';
      else
        Label52.Caption := '☆☆☆☆☆☆☆☆';
      end;
    end
    else  Label52.Caption := '☆☆☆☆☆☆☆☆';
  except
    ShowMessage('对不起，请输入数字！');
    Edit31.Clear;
  end;
end;

procedure TDetail_Form.Edit4Change(Sender: TObject);
var str : string;
    birthdaytime: Tdatetime;
    f_ages : real;
begin

  with dm.tmp do
  begin
    close;
    SQL.Clear;
    SQL.Text := 'select * from datadetail where item = ' + QuotedStr(LeftStr(Edit4.Text, 6));
    Open;
    if not IsEmpty then
    begin
      Edit32.Text := FieldValues['memo'];
      Edit32.Tag := FieldValues['rkey'];
    end
    else
    begin
      Edit32.Clear;
      Edit32.Tag := 0;
    end;
  end;
 str := midstr(edit4.Text,7,4)+'-'+ midstr(edit4.Text,11,2) +'-'+midstr(edit4.Text,13,2);
 if (length(edit4.Text)=18)  then
 begin
 if  trystrtodate(str,birthdaytime)
 then
 begin
  datetimepicker1.Date := birthdaytime;
  datetimepicker1.OnClick(sender);
  {f_ages :=trunc(MonthsBetween(now,datetimepicker1.Date)/12.0);
  if MonthsBetween(now,datetimepicker1.Date) mod 12 = 0
  then
  begin
    if dayof(now)< dayof(datetimepicker1.Date)  then f_ages := f_ages-1+0.11
    else f_ages := f_ages+0.00;
  end
   else
   begin
     f_ages :=  f_ages +  (MonthsBetween(now,datetimepicker1.Date) mod 12 )/100;
   end;
 // showmessage( formatfloat('0.00',f_ages))  ;
  label55.Caption := formatfloat('0.00',f_ages)+'岁'; }

 end;
 end;

end;

procedure TDetail_Form.BitBtn2Click(Sender: TObject);
var
  i: Integer;
  FamilyInfo: string;
begin
  with DM.tmp do
  begin
    if Trim(SGrid.Cells[1, 1]) <> '' then
    begin
      for i := 1 to SGrid.RowCount - 1 do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select chinesename,departmentname, '
          + ' case sex when 0 then ''女'' else ''男'' end SexDisplay, '
          + ' case status when 1 then ''在职'' when 2 then ''离职'' end statusDisplay '
          + ' from employeemsg '
          + ' inner join datadepartment on employeemsg.departmentid = datadepartment.rkey '
          + ' where chinesename = ' + QuotedStr(SGrid.Cells[1, i]);
        Open;
        if not IsEmpty then
        begin
          FamilyInfo := FamilyInfo + FieldValues['chinesename']
            + ',' + FieldValues['SexDisplay']
            + ',' + FieldValues['departmentname']
            + ',' + FieldValues['statusDisplay'] + #13;
        end;
      end;
      if FamilyInfo <> '' then ShowMessage('家庭成员有本厂为员工记录：' + #13+ #13 + FamilyInfo);
    end;
  end;
end;

procedure TDetail_Form.SpeedButton7Click(Sender: TObject);
begin
  with DM.tmp do
  begin
    if Trim(Edit21.Text) <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select employeecode,chinesename,departmentname, '
        + ' case sex when 0 then ''女'' else ''男'' end SexDisplay, '
        + ' case status when 1 then ''在职'' when 2 then ''离职'' end statusDisplay '
        + ' from employeemsg '
        + ' inner join datadepartment on employeemsg.departmentid = datadepartment.rkey '
        + ' where chinesename = ' + QuotedStr(Edit21.Text) ;
      Open;
      if not IsEmpty then
      begin
        ShowMessage('紧急联络人: ' + FieldValues['chinesename'] + ' 为本厂员工，概览如下：'
          + #13 + #13 + '工号: ' + FieldValues['employeecode']
          + #13 +  '姓名: ' + FieldValues['chinesename']
          + #13 +  '性别: ' + FieldValues['SexDisplay']
          + #13 +  '部门: ' + FieldValues['departmentname']
          + #13 +  '状态: ' + FieldValues['statusDisplay']);
      end;
    end;
  end;
end;

procedure TDetail_Form.SpeedButton8Click(Sender: TObject);
begin
  with DM.tmp do
  begin
    if Trim(Edit29.Text) <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select employeecode,chinesename,departmentname, '
        + ' case sex when 0 then ''女'' else ''男'' end SexDisplay, '
        + ' case status when 1 then ''在职'' when 2 then ''离职'' end statusDisplay '
        + ' from employeemsg '
        + ' inner join datadepartment on employeemsg.departmentid = datadepartment.rkey '
        + ' where chinesename = ' + QuotedStr(Edit29.Text) ;
      Open;
      if not IsEmpty then
      begin
        ShowMessage('担保人: ' + FieldValues['chinesename'] + ' 为本厂员工，概览如下：'
          + #13 + #13 + '工号: ' + FieldValues['employeecode']
          + #13 +  '姓名: ' + FieldValues['chinesename']
          + #13 +  '性别: ' + FieldValues['SexDisplay']
          + #13 +  '部门: ' + FieldValues['departmentname']
          + #13 +  '状态: ' + FieldValues['statusDisplay']);
      end;
    end;
  end;
end;

procedure TDetail_Form.SpeedButton9Click(Sender: TObject);
begin
  with DM.tmp do
  begin
    if Trim(Edit24.Text) <> '' then
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select employeecode,chinesename,departmentname, '
        + ' case sex when 0 then ''女'' else ''男'' end SexDisplay, '
        + ' case status when 1 then ''在职'' when 2 then ''离职'' end statusDisplay '
        + ' from employeemsg '
        + ' inner join datadepartment on employeemsg.departmentid = datadepartment.rkey '
        + ' where chinesename = ' + QuotedStr(Edit24.Text) ;
      Open;
      if not IsEmpty then
      begin
        ShowMessage('推荐人: ' + FieldValues['chinesename'] + ' 为本厂员工，概览如下：'
          + #13 + #13 + '工号: ' + FieldValues['employeecode']
          + #13 +  '姓名: ' + FieldValues['chinesename']
          + #13 +  '性别: ' + FieldValues['SexDisplay']
          + #13 +  '部门: ' + FieldValues['departmentname']
          + #13 +  '状态: ' + FieldValues['statusDisplay']);
      end;
    end;
  end;
end;

procedure TDetail_Form.SpeedButton10Click(Sender: TObject);
begin
  if MessageBox(Handle,'确定清空该身份正有效期吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  DateTime_SetFormat(DateTimePicker4.Handle, '''    -  -  ''');
end;

procedure TDetail_Form.SGridKeyPress(Sender: TObject; var Key: Char);
var acol,arow: Integer;
begin
  acol :=  (Sender as TStringGrid).Col;
  arow :=  (Sender as TStringGrid).Row;
 if ( acol=  5) and
    (arow = SGrid.RowCount-1)
     and     (key in [ #13])
       then  SpeedButton3.Click;

end;


procedure TDetail_Form.Edit4Exit(Sender: TObject);
var result_str : string;
begin
  if  Edit4.Text='' then Abort;
  dm.tmp.SQL.Clear;
  dm.tmp.SQL.Text :=' select dbo.get_hrVerification_IdenNo('+quotedstr(Edit4.Text)+') as result';
  dm.tmp.ExecSQL;
  DM.tmp.Open;
  result_str := dm.tmp.FieldByName('result').AsString ;
  dm.tmp.Close;
  dm.tmp.SQL.Clear;
  if result_str <>'正确'then
  begin
    if messagedlg('请确认身份证号是否正确！！继续保存吗？',mtwarning, [mbok, mbcancel],1) = mrcancel then
    Edit4.SetFocus;
    Abort;
  end;
end;

procedure TDetail_Form.btn1Click(Sender: TObject);
begin
    if (StrToInt(vprev) <> 2) and (StrToInt(vprev) <> 4) then
    begin
      ShowMessage('您的权限不够，请联系管理员！');
      Exit;
    end;
  self.SavePictureDialog1.FileName := edit1.Text+edit2.Text+'.jpg';
  if self.SavePictureDialog1.Execute then    image1.Picture.SaveToFile(self.SavePictureDialog1.FileName)

 else   messagedlg('图片保存失败!',mterror,[mbcancel],0);
end;

end.


