unit UDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, daDataModule, ComCtrls,ExtDlgs,jpeg, DBCtrls, CommCtrl,StrUtils,DateUtils;

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
    Edit28: TEdit;
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
    procedure Edit18KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private

    { Private declarations }
  public
      Ftag:integer;
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
  m_szDllPath : string;

implementation

uses UDM,common,Pick_Item_Single,ConstVar, UQueDep, UMain;

{$R *.dfm}

procedure TDetail_Form.FormCreate(Sender: TObject);
var
  QueryTmp:TADOQuery;
begin
  QueryTmp:=TADOQuery.Create(Self);
  QueryTmp.Connection := DM.ADOConnection1;
  with QueryTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 5 '+#13;
    Open;
    first;
    while not Eof do
    begin
      ComboBox2.Items.AddObject(FieldByName('item').AsString,TObject(FieldByName('rkey').AsInteger));
      Next;
    end;
  end;

  with QueryTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 2 '+#13;
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
    SQL.Text := 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 3 '+#13;
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
    SQL.Text := 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 17 '+#13;
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
    SQL.Text := 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 4 '+#13;
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
    SQL.Text := 'SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 11 '+#13;
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
    SQL.Text := ' select getdate() '+#13;
    Open;
    DateTimePicker1.Date:= Fields[0].AsDateTime - 365;
    DateTimePicker2.Date:= Fields[0].AsDateTime;
    DateTimePicker3.Date:= Fields[0].AsDateTime + 90;
  end;
  with QueryTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select top 1  * from employeemsg  where status=1 order by cast(employeecode as int ) desc';
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
  QueryTmp := TADOQuery.Create(Self);
  QueryTmp.Connection := DM.ADOConnection1;
  if Ftag=0 then
  begin
    {DM.employee_msg_1.Close;
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
    Label8.Font.Color := clRed; }
  end
  else
  begin
    if  Ftag=1 then
    begin
      {DM.employee_msg_1.Close;
      DM.employee_msg_1.Parameters[0].Value:=DM.employee_msgrkey.AsInteger;
      DM.employee_msg_1.Open;
      self.Caption:='员工信息-修改';
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
        SQL.Text:=' SELECT  rkey, departmentname FROM  datadepartment where  rkey = '+dm.employee_msg_1departmentid.AsString +#13;
        Open;
        Self.Edit10.Tag :=  FieldByName('rkey').AsInteger;
        Self.Edit10.Text :=   FieldByName('departmentname').AsString;
      end;
      if DM.employee_msg_1.FieldByName('marriage').AsString <> '' then
      ComboBox13.ItemIndex := ComboBox13.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('marriage').AsInteger));
      Edit3.text := DM.employee_msg_1.FieldByName('phone').AsString ;
      Edit4.text := DM.employee_msg_1.FieldByName('IDCard').AsString;
      Edit5.text := DM.employee_msg_1.FieldByName('addr').AsString;
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
          SQL.Text:=' SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 1 and  rkey = '+ DM.employee_msg_1.FieldByName('Position').AsString+#13;
          Open;
          Self.Edit7.Tag :=  FieldByName('rkey').AsInteger;
          Self.Edit7.Text :=   FieldByName('item').AsString;
        end;
      end;
      if  DM.employee_msg_1.FieldByName('station').AsString <> '' then
      begin
        with QueryTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:=' SELECT   rkey, dictid, item  FROM  dbo.datadetail WHERE dictid = 16 and  rkey = '+ DM.employee_msg_1.FieldByName('station').AsString+#13;
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
        DateTimePicker2.Date :=  DM.employee_msg_1.FieldByName('ondutytime').AsDateTime;
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
      Edit15.text := DM.employee_msg_1.FieldByName('roomcode').AsString;
      Memo1.Text := DM.employee_msg_1.FieldByName('resume').Value;
      if DM.employee_msg_1.FieldByName('wagetype').AsString <> '' then
      with QueryTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:=' SELECT     rkey, Accountname  FROM  dbo.salaryaccount WHERE rkey = '+DM.employee_msg_1.FieldByName('wagetype').AsString +#13;
        Open;
        Edit16.text :=  FieldByName('Accountname').AsString;
        Edit16.Hint :=   FieldByName('rkey').AsString;
      end;
      ComboBox1.text := DM.employee_msg_1.FieldByName('blood_type').AsString;
      Edit12.text := DM.employee_msg_1.FieldByName('Height').AsString;
      Edit01.Text := DM.employee_msg_1.FieldByName('graduatedschool').AsString;
      Edit8.Text := DM.employee_msg_1.FieldByName('majorsubject').AsString;
      Edit27.Text := DM.employee_msg_1.FieldByName('GraduateTime').AsString;
      Edit11.Text := DM.employee_msg_1.FieldByName('Residencepermit').AsString;
      if DM.employee_msg_1.FieldByName('iDCardtime').AsString <> '' then
      begin
        DateTime_SetFormat(DateTimePicker4.Handle,PChar('yyyy-MM-dd'));
        DateTimePicker4.DateTime := DM.employee_msg_1.FieldByName('iDCardtime').AsDateTime;
        DateTimePicker4.Hint := 'A';
        //Edit28.Text := DM.employee_msg_1.FieldByName('iDCardtime').AsString;
      end
      else
      begin
        DateTime_SetFormat(DateTimePicker4.Handle,'''    -  -  ''');
        DateTimePicker4.Hint := '';
      end;
      Edit17.Text :=   DM.employee_msg_1.FieldByName('contactpersonaddr').AsString;
      Edit18.Text :=   DM.employee_msg_1.FieldByName('sicardno').AsString;
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
      else Image1.Picture.Graphic := nil;}
    end
    else
      if Ftag = 4 then
      begin

        DM.employee_msg_1.Close;
        DM.employee_msg_1.Parameters[0].Value:=DM.employee_msgrkey.AsInteger;
        DM.employee_msg_1.Open;
        self.Caption:='员工信息-查看';
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
        ComboBox3.text := DM.employee_msg_1.FieldByName('nation').AsString;
        Edit6.text := DM.employee_msg_1.FieldByName('province').AsString;
        if DM.employee_msg_1.FieldByName('education').AsString <> '' then
        ComboBox10.ItemIndex := ComboBox10.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('education').AsInteger));
        if DM.employee_msg_1.FieldByName('Politics_face').AsString <> '' then
        ComboBox12.ItemIndex := ComboBox12.Items.IndexOfObject(TObject(DM.employee_msg_1.FieldByName('Politics_face').AsInteger));
        if  DM.employee_msg_1.FieldByName('Position').AsString <> '' then
        Edit7.Text := DM.employee_msg.FieldByName('Positionitem').AsString;
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
          SQL.Text:=' SELECT     rkey, Accountname  FROM  dbo.salaryaccount WHERE rkey = '+DM.employee_msg_1.FieldByName('wagetype').AsString +#13;
          Open;
          Edit16.text :=  FieldByName('Accountname').AsString;
          Edit16.Hint :=   FieldByName('rkey').AsString;
        end;

        ComboBox1.text := DM.employee_msg_1.FieldByName('blood_type').AsString;
        Edit12.text   :=  DM.employee_msg_1.FieldByName('Height').AsString;
        Edit01.Text  :=   DM.employee_msg_1.FieldByName('graduatedschool').AsString;
        Edit8.Text  :=    DM.employee_msg_1.FieldByName('majorsubject').AsString;
        Edit27.Text  :=    DM.employee_msg_1.FieldByName('GraduateTime').AsString;
        Edit11.Text :=   DM.employee_msg_1.FieldByName('Residencepermit').AsString;
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
            { PicStream.Seek(JpegStartsInBlob(dm.employee_msgphoto),soFromBeginning); }
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
      + 'departmentcount, scarcity from datadepartment where rkey=' + IntToStr(Self.Edit10.Tag);
    Open;
    //ShowMessage(FieldByName('departmentcount').AsString + ', ' + IntToStr(Round (FieldByName('departmentration').AsInteger * (1 + FieldByName('max_overproof_percent').AsInteger/100)))) ;
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
  tmp1, i, Orkey,Urkey : Integer;
begin
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

  if (Label1.Font.Color = clRed) or  (Label14.Font.Color= clRed) or (Label13.Font.Color = clRed) or (Label17.Font.Color=clRed) or (Label6.Font.Color=clRed) or (Label11.Font.Color=clRed) or (Label8.Font.Color=clRed)
  then
  begin
    ShowMessage('红色字段为必填项，不能为空，请填写。');
    abort;
  end;
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
  with QueryTmp do  //检查身份证号码是否存在，如果存在，则保存失败
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey,employeecode,chinesename, IDCard from dbo.employeemsg where  IDCard='''+trim(Edit4.Text)+'''';
    Open;
    if (not IsEmpty) and (Ftag=0) then
    begin
      ShowMessage('该身份证号码 '+ FieldValues['IDCard'] +' 已有登记记录, 员工姓名为: ' + FieldValues['chinesename'] + ' ,工号为: '+FieldValues['employeecode']);
      abort;
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
      DM.employee_msg_1.FieldByName('nation').AsString := Trim(ComboBox3.Text); //民族
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
      //第二联系电话
      DM.employee_msg_1.FieldByName('others_contacts').Value := Trim(Edit9.text);
      if Edit10.Text <> '' then DM.employee_msg_1.FieldByName('departmentid').AsInteger := Edit10.Tag;  //部门
      if Trim(Edit7.text) <> '' then DM.employee_msg_1.FieldByName('Position').AsInteger := Edit7.Tag;  //职务
      if Trim(Edit14.text) <> '' then DM.employee_msg_1.FieldByName('station').AsInteger := Edit14.Tag;  //职务
      if Trim(ComboBox7.text) <> '' then DM.employee_msg_1.FieldByName('Rank').AsInteger := Integer(ComboBox7.Items.Objects[ComboBox7.itemindex]);  //职级
      if Trim(ComboBox2.text) <> '' then DM.employee_msg_1.FieldByName('employ_type').AsInteger := Integer(ComboBox2.Items.Objects[ComboBox2.itemindex]); //合同类型
      if Trim(ComboBox4.text) <> '' then DM.employee_msg_1.FieldByName('source').AsInteger := Integer(ComboBox4.Items.Objects[ComboBox4.itemindex]); //录用来源
      {if Trim(ComboBox5.text) <> '' then DM.employee_msg_1.FieldByName('station').AsInteger := Integer(ComboBox5.Items.Objects[ComboBox5.itemindex]); //录用来源 }
      if RadioGroup2.ItemIndex <> -1 then DM.employee_msg_1.FieldByName('attendance').AsInteger := RadioGroup2.ItemIndex;  //是否考勤
      DM.employee_msg_1.FieldByName('Cardno').Value := Trim(Edit13.text);     //考勤卡号
      DM.employee_msg_1.FieldByName('roomcode').Value := Trim(Edit15.text);   //床位编号
      if Trim(Edit16.Hint)<> '' then DM.employee_msg_1.FieldByName('wagetype').Value := Trim(Edit16.Hint);  //帐套类型
      if (Memo1.Font.Color <> cl3DDkShadow) or (Memo1.Text <> '') then DM.employee_msg_1.FieldByName('resume').Value := Memo1.text; //履历
      if  (ComboBox1.Text <> '') then DM.employee_msg_1.FieldByName('blood_type').Value := ComboBox1.text;  //血型
      if  (Edit12.Text <> '') then DM.employee_msg_1.FieldByName('Height').AsInteger := StrToInt(trim(Edit12.text));  //身高
      if  (Edit01.Text <> '') then DM.employee_msg_1.FieldByName('graduatedschool').Value := Edit01.Text;  //毕业院校
      if  (Edit8.Text <> '') then DM.employee_msg_1.FieldByName('majorsubject').Value := Edit8.Text;     //专业
      if  (Edit27.Text <> '') then DM.employee_msg_1.FieldByName('GraduateTime').Value := Edit27.Text;   //毕业时间
      if  (Edit11.Text <> '') then DM.employee_msg_1.FieldByName('Residencepermit').Value := Edit11.Text;   //居住证
      if  (DateTimePicker4.Hint <> '') then DM.employee_msg_1.FieldByName('iDCardtime').AsString := DateToStr(DateTimePicker4.Date);  //身份证有效期
      //if  (Edit28.Text <> '') then DM.employee_msg_1.FieldByName('iDCardtime').AsString := Trim(Edit28.Text);
      if  (Edit17.Text <> '') then DM.employee_msg_1.FieldByName('contactpersonaddr').Value := Edit17.Text;  //紧急联络人住址
      if  (Edit18.Text <> '') then DM.employee_msg_1.FieldByName('sicardno').Value := Edit18.Text;
      if  (Edit19.Text <> '') then DM.employee_msg_1.FieldByName('bankaccount').Value := Edit19.Text;
      if  (Edit20.Text <> '') then DM.employee_msg_1.FieldByName('bankname').Value := Edit20.Text;
      if  (Edit21.Text <> '') then DM.employee_msg_1.FieldByName('contactpersonname').Value := Edit21.Text;
      if  (Edit22.Text <> '') then DM.employee_msg_1.FieldByName('contactpersontel').Value := Edit22.Text;
      if  (Edit24.Text <> '') then DM.employee_msg_1.FieldByName('recommendpersonname').Value := Edit24.Text;
      if  (Edit25.Text <> '') then DM.employee_msg_1.FieldByName('recommendpersontel').Value := Edit25.Text;
      if  (Edit26.Text <> '') then DM.employee_msg_1.FieldByName('recommendaddr').Value := Edit26.Text;
      if  (Edit23.Text <> '') then DM.employee_msg_1.FieldByName('recommendworkplace').Value := Edit23.Text;
      if  (Edit02.Text <> '') then DM.employee_msg_1.FieldByName('Languages').Value := Edit02.Text;
      DM.employee_msg_1.Post;
      DM.employee_msg_1.UpdateBatch(arAll);
      DM.ADOConnection1.CommitTrans;
      
      Frkeymsg := DM.employee_msg_1.FieldByName('rkey').asinteger;
     // DM.employee_msg.Locate('rkey', Frkeymsg, []);
      DM.ADOConnection1.BeginTrans;
      try
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
                DM.ADOEFR.FieldByName('opration_person').AsInteger  := StrToInt(Trim(user_ptr));
                DM.ADOEFR.Post;
          end;
          DM.ADOEFR.UpdateBatch(arAll);
          DM.ADOConnection1.CommitTrans;
      except
      on e:Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        ShowMessage('保存过程中出现错误！'+#13+'出错原因：'+e.Message);
      end;
      end;

      {Main_Form.SGrid_tmp1.RowCount := SGrid.ColCount;
      Main_Form.SGrid_tmp1.RowCount := SGrid.RowCount;
      for i:= 1 to SGrid.RowCount-1  do
      begin
        Main_Form.SGrid_tmp1.Rows[i]:=SGrid.Rows[i];
      end;
      for i:= 0 to SGrid.ColCount-1  do
      begin
        Main_Form.SGrid_tmp1.Cols[i]:=SGrid.Cols[i];
      end;}

      //如果是新增操作
      if Ftag=0 then
      begin
        try
          DM.ADOConnection1.BeginTrans;
          //获取操作人员rkey
          with DM.tmp1 do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'select data0005.rkey, data0073.employee_ptr  from data0005 inner join data0073 on data0005.rkey=data0073.employee_ptr where data0073.rkey= '+ rkey73;
            Open;
            Orkey := FieldValues['rkey'];
          end;
          // 获取新增人员rkey
          with DM.tmp2 do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'select rkey from employeemsg where IDCard='+quotedStr(Edit4.Text);
            Open;
            Urkey := FieldValues['rkey'];
          end;
          //插入合同信息
          with DM.tmp do
          begin
            Close;
            SQL.Text := 'insert into dbo.employee_contract values('+quotedStr(Edit1.Text)+','
              + IntToStr(Urkey) +','
              + QuotedStr(DateToStr(DateTimePicker2.Date)) + ','   //合同开始日期  当天日期
              + QuotedStr(DateToStr(IncMonth(DateTimePicker2.Date, +3))) +','   //试用期满日期
              + QuotedStr(DateToStr(IncYear(DateTimePicker2.Date, +3))) +    //合同结束日期
              ', 447, '
              + QuotedStr(DateToStr(Now())) + ',' + IntToStr(Orkey) + ',1,'' '' )';
            ExecSQL;
          end;
          if (Application.MessageBox('该记录已保存成功，是否继续操作?', PChar('提示'),MB_YESNO)=6) then
          begin
            for i:= 0 to ComponentCount - 1 do
            begin
              if Self.Components[i] is TEdit then
              begin
                TEdit(Components[i]).Clear;
              end;
            end;
            with DM.tmp do
            begin
              Close;
              SQL.Clear;
              SQL.Text:='select top 1  * from employeemsg  where status=1 order by cast(employeecode as int ) desc';
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
          DM.ADOConnection1.CommitTrans;
        except
          on e: Exception do
          begin
            DM.ADOConnection1.RollbackTrans;
            ShowMessage('网络不稳定，请重新输入, (' + e.Message+')');
          end;
        end;
      end
      else
      begin
         FimilyTag := 1;
        modalresult := mrok;
      end;
    except
      on E: Exception do
      begin
        DM.ADOConnection1.RollbackTrans;
        showmessage('网络不稳定，请重新输入, (' + e.Message+')');
      end;
    end;
  end;
  with dm.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'exec dbo.hrsp_update_datadepartment_empcount';
    ExecSQL;
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

procedure TDetail_Form.BitBtn1Click(Sender: TObject);
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
begin
  if (Edit2.Text <> '') or (Edit4.Text <> '') or (Edit5.Text <> '') or(Edit6.Text <> '') or (RadioGroup1.ItemIndex <> -1) or (ComboBox3.Text <> '') or (DateTimePicker1.Hint <> '') or (DateTimePicker4.Hint <> '') //(edit28.text <> '')
  then
  begin
    if  (Application.MessageBox('从身份证读取后，一些已填写的资料将被新内容替换，是否继续?', PChar('提示'),MB_YESNO)=6) then
    begin
      Edit2.Text := '';
      Edit4.Text := '';
      Edit5.Text := '';
      image1.Picture.Assign(nil);
      FillChar(szName, sizeof(szName), 0);
      m_szDllPath := ExtractFilePath(application.ExeName);
      iRet := InitComm1(strToint('1001'), strToint('115200'));
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
      with DM.tmp do  //检查身份证号码是否存在
      begin
        Close;
        SQL.Clear;
        SQL.Text:='select rkey,employeecode,chinesename, IDCard from dbo.employeemsg where  IDCard='''+trim(Edit4.Text)+'''';
        Open;
        if (not IsEmpty) and (Ftag=0) then
        begin
          ShowMessage('该身份证号码 '+ FieldValues['IDCard'] +' 已有登记记录, 员工姓名为: ' + FieldValues['chinesename'] + ' ,工号为: '+FieldValues['employeecode']);
        end;
      end;
      Edit5.Text := szAddress;
      Edit6.Text := LeftStr(szAddress,6);
      DateTimePicker4.Date := StrToDate(Format('%s-%s-%s', [copy(szEndDate,1,4), copy(szEndDate, 5, 2), copy(szEndDate, 7,2)]));
      DateTimePicker4.Date := StrToDate(copy(szEndDate,1,4) + '-' + copy(szEndDate, 5, 2) + '-' + copy(szEndDate, 7,2));
      DateTimePicker4.Hint := 'A';
      //Edit28.Text := szEndDate;
      ComboBox3.Text := szNation+'族';
      if not FileExists(m_szDllPath+'zp.bmp') then
      begin
        Application.MessageBox('文件不存在，请重新读取','错误',mb_iconerror);
        Exit;
      end;
      image1.Picture.LoadFromFile(m_szDllPath+'zp.bmp');
      DeleteFile(m_szDllPath+'\zp.bmp');
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
    //DateTimePicker4.Date := StrToDate(Format('%s-%s-%s', [copy(szEndDate,1,4), copy(szEndDate, 5, 2), copy(szEndDate, 7,2)]));
    DateTimePicker4.Date := StrToDate(copy(szEndDate,1,4) + '-' + copy(szEndDate, 5, 2) + '-' + copy(szEndDate, 7,2));
    DateTimePicker4.Hint := 'A';
    //Edit28.Text := szEndDate;
    if not FileExists(m_szDllPath+'zp.bmp') then
    begin
       Application.MessageBox('文件不存在，请重新读取','错误',mb_iconerror);
       Exit;
    end;
    image1.Picture.LoadFromFile(m_szDllPath+'zp.bmp');
    DeleteFile(m_szDllPath+'\zp.bmp');
  end;
  with DM.tmp do  //检查身份证号码是否存在
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey,employeecode,chinesename, IDCard from dbo.employeemsg where IDCard='''+trim(Edit4.Text)+'''';
    Open;
    if (not IsEmpty) and (Ftag=0) then
    begin
      ShowMessage('该身份证号码 '+ FieldValues['IDCard'] +' 已有登记记录, 员工姓名为: ' + FieldValues['chinesename'] + ' ,工号为: '+FieldValues['employeecode']);
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
begin
  DateTime_SetFormat(DateTimePicker1.Handle,PChar('yyyy-MM-dd'));
  DateTimePicker1.Hint := 'A';
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
  if not (key in [ '0'..'9',#8,chr(VK_delete)]) then key := char(0);
end;

procedure TDetail_Form.SpeedButton2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'Accountname/帐套名称/100,discription/描述/100,'
    + 'remark/备注/100';
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

procedure TDetail_Form.Edit18KeyPress(Sender: TObject; var Key: Char);
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
  InputVar.Fields := 'item/岗位名称/500';
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

procedure TDetail_Form.BitBtn9Click(Sender: TObject);
begin
  Close;
end;

procedure TDetail_Form.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',#8,chr(VK_delete)]) then Key := #0;
end;

end.
