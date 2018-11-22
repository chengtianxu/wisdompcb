unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, ExtCtrls, DB, ADODB, ComCtrls,DateUtils;

type
  TFrmMain = class(TForm)
    ADOConnection1: TADOConnection;
    ADOData0508: TADOQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    SpinEdit5: TSpinEdit;
    SpinEdit6: TSpinEdit;
    Memo1: TMemo;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    ADOQuery1: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  common;
{$R *.dfm}

procedure TFrmMain.BitBtn1Click(Sender: TObject);
//var
// i:integer;
begin

  if spinedit1.Value+spinedit2.Value+spinedit3.Value+spinedit4.Value
     +spinedit5.Value+spinedit6.Value > 18  then
     messagedlg('科目编码总长度不得超过18位！',mtinformation,[mbok],0)
  else
  try
      ADOConnection1.BeginTrans ;
      screen.Cursor:=crhourglass;

      Adodata0508.edit;
      Adodata0508.fieldbyname('class1').asinteger:=Spinedit1.value;
      Adodata0508.fieldbyname('class2').asinteger:=Spinedit2.value;
      Adodata0508.fieldbyname('class3').asinteger:=Spinedit3.value;
      Adodata0508.fieldbyname('class4').asinteger:=Spinedit4.value;
      Adodata0508.fieldbyname('class5').asinteger:=Spinedit5.value;
      Adodata0508.fieldbyname('class6').asinteger:=Spinedit6.value;
      Adodata0508.fieldbyname('open_date').AsDateTime:=Datetimepicker1.Date;
      Adodata0508.fieldbyname('reset_flag').asinteger:=1;
      adodata0508.FieldByName('CURR_FYEAR').AsInteger:=yearof(Datetimepicker1.Date);
      adodata0508.FieldByName('CURR_PERIOD').AsInteger:=monthof(Datetimepicker1.Date);
      Adodata0508.post;

     self.ADOQuery1.Close;
     self.ADOQuery1.SQL.Text:='delete data0103';
     ADOQuery1.ExecSQL;

    // i:=self.ADOQuery1.ExecSQL;

{     if i > 0 then //如果data0103有记录，前面的删除命今生效那么DBCC CHECKIDENT 参数应该为0
     begin
     self.ADOQuery1.Close;
     self.ADOQuery1.SQL.Text:='DBCC CHECKIDENT (''data0103'', RESEED, 0)'+#13+
                              'WITH NO_INFOMSGS ';
     self.ADOQuery1.ExecSQL;
     end
     else       //如果data0103先前没有记录，前面的删除命今无效那么DBCC CHECKIDENT 参数应该为1
      begin
       self.ADOQuery1.Close;
       self.ADOQuery1.SQL.Text:='DBCC CHECKIDENT (''data0103'', RESEED, 1)'+#13+
                                'WITH NO_INFOMSGS ';
       self.ADOQuery1.ExecSQL;
      end;
}
     self.ADOQuery1.Close;
     self.ADOQuery1.SQL.Text:='SET IDENTITY_INSERT data0103 ON';
     ADOQuery1.ExecSQL;

     self.ADOQuery1.Close;
     self.ADOQuery1.SQL.Text:=' INSERT INTO Data0103'+#13+
  '(rkey,TTYPE, GL_ACC_NUMBER, GL_DESCRIPTION, HAS_CHILD, PARENT_PTR, DB_CR, ACC_TP)'+#13+
  'SELECT rkey,TTYPE, GL_ACC_NUMBER, GL_DESCRIPTION, HAS_CHILD, PARENT_PTR, DB_CR, ACC_TP'+#13+
  'FROM  Data0510';
     self.ADOQuery1.ExecSQL;

     self.ADOQuery1.Close;
     self.ADOQuery1.SQL.Text:='SET IDENTITY_INSERT data0103 off';
     ADOQuery1.ExecSQL;

      ADOConnection1.CommitTrans ;
      messagedlg('会计科目表已经成功创建！',mtinformation,[mbok],0);
      self.ADOData0508.Close;
      screen.Cursor:=crDefault;
      application.Terminate;
  except
    on e :exception do
     begin
      ADOConnection1.RollbackTrans ;
      screen.Cursor:=crDefault;
      showmsg('会计科目表创建成功不成功！'+#13#10+e.Message,1);
     end;
  end;
end;

procedure TFrmMain.FormActivate(Sender: TObject);
begin
  ADOData0508.Open ;
 if Adodata0508.fieldbyname('reset_flag').asinteger=1 then
      bitbtn1.Enabled := false;


   Spinedit1.value :=  Adodata0508.fieldbyname('class1').asinteger;
   Spinedit2.value :=  Adodata0508.fieldbyname('class2').asinteger;
   Spinedit3.value :=  Adodata0508.fieldbyname('class3').asinteger;
   Spinedit4.value :=  Adodata0508.fieldbyname('class4').asinteger;
   Spinedit5.value :=  Adodata0508.fieldbyname('class5').asinteger;
   Spinedit6.value :=  Adodata0508.fieldbyname('class6').asinteger;

      
 Datetimepicker1.Date :=getsystem_date(self.ADOQuery1,1);
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
 if not App_Init(ADOConnection1) then
  begin
   ShowMsg('程序起动失败请联系管理员',1);
   application.Terminate;
  end;
  Caption := application.Title;
end;

end.
