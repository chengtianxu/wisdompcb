unit DataTransSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,IniFiles, Spin, ComCtrls, Grids,
  Calendar, ShellCtrls,Registry;

type
  TFrmDataTransSet = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    CheckBox32: TCheckBox;
    CheckBox33: TCheckBox;
    CheckBox34: TCheckBox;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox37: TCheckBox;
    CheckBox38: TCheckBox;
    CheckBox39: TCheckBox;
    CheckBox40: TCheckBox;
    CheckBox41: TCheckBox;
    CheckBox42: TCheckBox;
    CheckBox43: TCheckBox;
    CheckBox44: TCheckBox;
    CheckBox45: TCheckBox;
    CheckBox46: TCheckBox;
    CheckBox47: TCheckBox;
    CheckBox48: TCheckBox;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    Label3: TLabel;
    Edit2: TEdit;
    DateTimePicker2: TDateTimePicker;
    CheckBox49: TCheckBox;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    CheckBox50: TCheckBox;
    SpinEdit1: TSpinEdit;
    CheckBox51: TCheckBox;
    CheckBox52: TCheckBox;
    CheckBox53: TCheckBox;
    CheckBox54: TCheckBox;
    CheckBox55: TCheckBox;
    CheckBox56: TCheckBox;
    CheckBox57: TCheckBox;
    CheckBox58: TCheckBox;
    CheckBox59: TCheckBox;
    CheckBox60: TCheckBox;
    CheckBox61: TCheckBox;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    SpinEdit5: TSpinEdit;
    SpinEdit6: TSpinEdit;
    SpinEdit7: TSpinEdit;
    SpinEdit8: TSpinEdit;
    SpinEdit9: TSpinEdit;
    SpinEdit10: TSpinEdit;
    SpinEdit11: TSpinEdit;
    SpinEdit12: TSpinEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label4: TLabel;
    DateTimePicker4: TDateTimePicker;
    CheckBox62: TCheckBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDataTransSet: TFrmDataTransSet;

implementation

uses Path;

{$R *.dfm}

procedure TFrmDataTransSet.BitBtn1Click(Sender: TObject);
var inifile1:Tinifile;Filename:String;i:integer;
begin
   if (Edit1.Text='') then
      begin
        Showmessage('Data is Null');
        exit;
      end;
 Filename:=ExtractFilePath(Paramstr(0))+'ProgramSet.ini';
 inifile1:=Tinifile.Create(filename);
 inifile1.writestring('数据库地址设定','数据库IP地址',Edit1.Text);
 case RadioGroup1.ItemIndex of
 0:inifile1.writestring('数据上传设定','数据上传状态','true');
 1:inifile1.writestring('数据上传设定','数据上传状态','false');
 end;
 inifile1.writestring('数据上传设定','生效日期',formatdatetime('yyyy/mm/dd',DateTimePicker1.date));
 for i:=0 to Self.Componentcount-1 do
   if (Self.Components[i] is TCheckBox) and ((Self.Components[i] as TCheckBox).checked=true) and ((Self.Components[i] as TCheckBox).tag<48)  then
     inifile1.writestring('上传时间段设置',(Self.Components[i] as TCheckBox).Caption,'true')
   else if (Self.Components[i] is TCheckBox) and ((Self.Components[i] as TCheckBox).checked=false)  and ((Self.Components[i] as TCheckBox).tag<48) then
     inifile1.writestring('上传时间段设置',(Self.Components[i] as TCheckBox).Caption,'false');


 inifile1.writestring('备份路径','数据库备份路径',Edit2.Text);
 inifile1.writestring('备份数据生效时间设置','生效日期',formatdatetime('yyyy/mm/dd',DateTimePicker2.date));
 if CheckBox62.Checked then
   inifile1.writestring('启动备份','备份','true')
 else
   inifile1.writestring('启动备份','备份','false');
 if CheckBox49.Checked then
   inifile1.writestring('数据清理','清理','true')
 else
   inifile1.writestring('数据清理','清理','false');
  inifile1.writestring('备份时间设置','备份时间',formatdatetime('HH:MM:SS',DateTimePicker4.date));
  inifile1.EraseSection('备份周期设置');
 if CheckBox50.Checked then
   inifile1.writestring('备份周期设置',copy(CheckBox50.Caption,1,1)+'-'+inttostr(SpinEdit1.value),'true')
 else
   inifile1.writestring('备份周期设置',copy(CheckBox50.Caption,1,1)+'-'+inttostr(SpinEdit1.value),'false');
 if CheckBox51.Checked then
   inifile1.writestring('备份周期设置',copy(CheckBox51.Caption,1,1)+'-'+inttostr(SpinEdit2.value),'true')
 else
   inifile1.writestring('备份周期设置',copy(CheckBox51.Caption,1,1)+'-'+inttostr(SpinEdit2.value),'false');
 if CheckBox52.Checked then
   inifile1.writestring('备份周期设置',copy(CheckBox52.Caption,1,1)+'-'+inttostr(SpinEdit3.value),'true')
 else
   inifile1.writestring('备份周期设置',copy(CheckBox52.Caption,1,1)+'-'+inttostr(SpinEdit3.value),'false');
 if CheckBox53.Checked then
   inifile1.writestring('备份周期设置',copy(CheckBox53.Caption,1,1)+'-'+inttostr(SpinEdit4.value),'true')
 else
   inifile1.writestring('备份周期设置',copy(CheckBox53.Caption,1,1)+'-'+inttostr(SpinEdit4.value),'false');
 if CheckBox54.Checked then
   inifile1.writestring('备份周期设置',copy(CheckBox54.Caption,1,1)+'-'+inttostr(SpinEdit5.value),'true')
 else
   inifile1.writestring('备份周期设置',copy(CheckBox54.Caption,1,1)+'-'+inttostr(SpinEdit5.value),'false');
 if CheckBox55.Checked then
   inifile1.writestring('备份周期设置',copy(CheckBox55.Caption,1,1)+'-'+inttostr(SpinEdit6.value),'true')
 else
   inifile1.writestring('备份周期设置',copy(CheckBox55.Caption,1,1)+'-'+inttostr(SpinEdit6.value),'false');
 if CheckBox56.Checked then
   inifile1.writestring('备份周期设置',copy(CheckBox56.Caption,1,1)+'-'+inttostr(SpinEdit7.value),'true')
 else
   inifile1.writestring('备份周期设置',copy(CheckBox56.Caption,1,1)+'-'+inttostr(SpinEdit7.value),'false');
 if CheckBox57.Checked then
   inifile1.writestring('备份周期设置',copy(CheckBox57.Caption,1,1)+'-'+inttostr(SpinEdit8.value),'true')
 else
   inifile1.writestring('备份周期设置',copy(CheckBox57.Caption,1,1)+'-'+inttostr(SpinEdit8.value),'false');
 if CheckBox58.Checked then
   inifile1.writestring('备份周期设置',copy(CheckBox58.Caption,1,1)+'-'+inttostr(SpinEdit9.value),'true')
 else
   inifile1.writestring('备份周期设置',copy(CheckBox58.Caption,1,1)+'-'+inttostr(SpinEdit9.value),'false');
 if CheckBox59.Checked then
   inifile1.writestring('备份周期设置',copy(CheckBox59.Caption,1,2)+'-'+inttostr(SpinEdit10.value),'true')
 else
   inifile1.writestring('备份周期设置',copy(CheckBox59.Caption,1,2)+'-'+inttostr(SpinEdit10.value),'false');
 if CheckBox60.Checked then
   inifile1.writestring('备份周期设置',copy(CheckBox60.Caption,1,2)+'-'+inttostr(SpinEdit11.value),'true')
 else
   inifile1.writestring('备份周期设置',copy(CheckBox60.Caption,1,2)+'-'+inttostr(SpinEdit11.value),'false');
 if CheckBox61.Checked then
   inifile1.writestring('备份周期设置',copy(CheckBox61.Caption,1,2)+'-'+inttostr(SpinEdit12.value),'true')
 else
   inifile1.writestring('备份周期设置',copy(CheckBox61.Caption,1,2)+'-'+inttostr(SpinEdit12.value),'false');


{if (Self.Components[i] is TCheckBox) and ((Self.Components[i] as TCheckBox).checked=true) and ((Self.Components[i] as TCheckBox).tag>=48) then
inifile.writestring('备份周期设置',(Self.Components[i] as TCheckBox).Caption,'true')
else if (Self.Components[i] is TCheckBox) and ((Self.Components[i] as TCheckBox).checked=false) then
inifile.writestring('备份周期设置',(Self.Components[i] as TCheckBox).Caption,'false'); }
   inifile1.Free;
end;

procedure TFrmDataTransSet.FormShow(Sender: TObject);
var inifile:Tinifile;Sections:TStringList;i:integer;
begin
inifile:=Tinifile.create(ExtractFilePath(Paramstr(0))+'ProgramSet.ini');
Edit1.Text:=inifile.readstring('数据库地址设定','数据库IP地址','');
if inifile.readstring('数据上传设定','生效日期','')='' then
inifile.writestring('数据上传设定','生效日期',formatdatetime('yyyy/mm/dd',NOW()))
else
DateTimePicker1.Date:=Strtodatetime(inifile.readstring('数据上传设定','生效日期',''));
if inifile.readstring('数据上传设定','数据上传状态','')='' then
begin
inifile.writestring('数据上传设定','数据上传状态','false');
for i:=0 to Self.Componentcount-1 do
if Self.Components[i] is TCheckBox then
 inifile.writestring('上传时间段设置',(Self.Components[i] as TCheckBox).Caption,'false');
end
else
begin
for i:=0 to Self.Componentcount-1 do
if (Self.Components[i] is TCheckBox) and (inifile.readstring('上传时间段设置',(Self.Components[i] as TCheckBox).Caption,'')='true') then
(Self.Components[i] as TCheckBox).checked:=true
else if (Self.Components[i] is TCheckBox) and (inifile.readstring('上传时间段设置',(Self.Components[i] as TCheckBox).Caption,'')='false') then
(Self.Components[i] as TCheckBox).checked:=false;
end;
if inifile.readstring('数据上传设定','数据上传状态','')='false' then
RadioGroup1.ItemIndex:=1
else if inifile.readstring('数据上传设定','数据上传状态','')='true' then
RadioGroup1.ItemIndex:=0;

Edit2.Text:=inifile.readstring('备份路径','数据库备份路径','');
DateTimePicker4.Time:=Strtodatetime(inifile.readstring('备份时间设置','备份时间',''));
DateTimePicker2.Date:=Strtodatetime(inifile.readstring('备份数据生效时间设置','生效日期',''));
if inifile.readstring('数据清理','清理','')='false' then
CheckBox49.Checked :=false
else if inifile.readstring('数据清理','清理','')='true' then
CheckBox49.Checked :=true;
if inifile.readstring('启动备份','备份','')='false' then
CheckBox62.Checked :=false
else if inifile.readstring('启动备份','备份','')='true' then
CheckBox62.Checked :=true;


Sections := TStringList.Create;
inifile.ReadSections(Sections);
//ShowMessagefmt('Section Count: %d',[Sections.Count]);
inifile.ReadSectionValues(Sections[8],Sections);
SpinEdit1.Value:=strtoint(copy(Sections.Names[0],3,length(Sections.Names[0])-2));
if Sections.ValueFromIndex[0]='true' then
CheckBox50.Checked:=true
else
CheckBox50.Checked:=false;
SpinEdit2.Value:=strtoint(copy(Sections.Names[1],3,length(Sections.Names[1])-2));
if Sections.ValueFromIndex[1]='true' then
CheckBox51.Checked:=true
else
CheckBox51.Checked:=false;
SpinEdit3.Value:=strtoint(copy(Sections.Names[2],3,length(Sections.Names[2])-2));
if Sections.ValueFromIndex[2]='true' then
CheckBox52.Checked:=true
else
CheckBox52.Checked:=false;
SpinEdit4.Value:=strtoint(copy(Sections.Names[3],3,length(Sections.Names[3])-2));
if Sections.ValueFromIndex[3]='true' then
CheckBox53.Checked:=true
else
CheckBox53.Checked:=false;
SpinEdit5.Value:=strtoint(copy(Sections.Names[4],3,length(Sections.Names[4])-2));
if Sections.ValueFromIndex[4]='true' then
CheckBox54.Checked:=true
else
CheckBox54.Checked:=false;
SpinEdit6.Value:=strtoint(copy(Sections.Names[5],3,length(Sections.Names[5])-2));
if Sections.ValueFromIndex[5]='true' then
CheckBox55.Checked:=true
else
CheckBox55.Checked:=false;
SpinEdit7.Value:=strtoint(copy(Sections.Names[6],3,length(Sections.Names[6])-2));
if Sections.ValueFromIndex[6]='true' then
CheckBox56.Checked:=true
else
CheckBox56.Checked:=false;
SpinEdit8.Value:=strtoint(copy(Sections.Names[7],3,length(Sections.Names[7])-2));
if Sections.ValueFromIndex[7]='true' then
CheckBox57.Checked:=true
else
CheckBox57.Checked:=false;
SpinEdit9.Value:=strtoint(copy(Sections.Names[8],3,length(Sections.Names[8])-2));
if Sections.ValueFromIndex[8]='true' then
CheckBox58.Checked:=true
else
CheckBox58.Checked:=false;

SpinEdit10.Value:=strtoint(copy(Sections.Names[9],4,length(Sections.Names[9])-3));
if Sections.ValueFromIndex[9]='true' then
CheckBox59.Checked:=true
else
CheckBox59.Checked:=false;

SpinEdit11.Value:=strtoint(copy(Sections.Names[10],4,length(Sections.Names[10])-3));
if Sections.ValueFromIndex[10]='true' then
CheckBox60.Checked:=true
else
CheckBox60.Checked:=false;

SpinEdit12.Value:=strtoint(copy(Sections.Names[11],4,length(Sections.Names[11])-3));
if Sections.ValueFromIndex[11]='true' then
CheckBox61.Checked:=true
else
CheckBox61.Checked:=false;

Sections.Free;

inifile.Free;
end;

procedure TFrmDataTransSet.BitBtn3Click(Sender: TObject);
begin
  FrmPath:=TFrmPath.Create(Nil);
try
  FrmPath.ShowModal;
Finally
  FrmPath.Free;
end;
end;

procedure TFrmDataTransSet.BitBtn4Click(Sender: TObject);
var Reg:TRegistry;   sName,sValue:string;
begin
 if MessageDlg('确定设定系统自动启动吗?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
 begin
sName:=Application.Title;
sValue:=Application.ExeName;
Reg:=TRegistry.Create;
Reg.RootKey:=HKEY_LOCAL_MACHINE;
try
Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run',False);
Reg.WriteString(sName,sValue);
finally
Reg.CloseKey;
Reg.Free;
end;
 end;

end;

end.
