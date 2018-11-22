unit frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Menus,StrUtils;

type
  Tfrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Label8: TLabel;
    Edit5: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Edit6: TEdit;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4Enter(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
  Ftag:integer;
  end;

  function Stringremove_class(origanl_str,flag_str:string;step_i:integer):string;
var
  frm_detail: Tfrm_detail;

implementation
 uses common,damo,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure Tfrm_detail.ComboBox1Change(Sender: TObject);
begin
  if (combobox1.Items.Text='系统日历') then
    combobox1.Tag:=0
  else
    combobox1.Tag:=1;
end;

procedure Tfrm_detail.SpeedButton2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    if TComponent(Sender).Tag=0 then
    begin
      InputVar.Fields := 'classname/班次代码/120,classdesc/班次说明/120,A/时段1/50,B/时段1/50,C/时段2/50,D/时段2/50,E/时段3/50,F/时段3/50';
      InputVar.Sqlstr :='select rkey,classname,classdesc, substring(convert(nvarchar(20),ontime1,120),12,5) as A, '+
      ' substring(convert(nvarchar(20),outtime1,120),12,5) as B,'+
      ' substring(convert(nvarchar(20),ontime2,120),12,5) as C, '+
      ' substring(convert(nvarchar(20),outtime2,120),12,5) as D,'+
      ' substring(convert(nvarchar(20),ontime3,120),12,5) as E,'+
      ' substring(convert(nvarchar(20),outtime3,120),12,5) as F '+
      ' from class order by 2';
    end;  {end
    else
     if TComponent(Sender).Tag>=1 then begin
         // InputVar.InPut_value:=EdtDept.text;
      InputVar.Fields := 'dept_code/部门代码/200,dept_name/部门名称/250';
      InputVar.Sqlstr := 'select rkey,dept_code,dept_name from data0034 where active_flag=0 and ttype in (4,5) order by 2';
     }
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if TComponent(Sender).Tag=0 then
      begin
        if  Trim(edit4.Text)='' then
        begin
          edit4.Text:=frmPick_Item_Single.adsPick.FieldValues['classname'];
          edit6.Text:=inttostr(frmPick_Item_Single.adsPick.FieldValues['rkey']);
        end
        else
        begin
          edit4.Text:=edit4.Text+','+frmPick_Item_Single.adsPick.FieldValues['classname'];
          edit6.Text:=edit6.Text+','+inttostr(frmPick_Item_Single.adsPick.FieldValues['rkey']);
        end;
      {else if TComponent(Sender).Tag=5 then begin
        edit8.Text := frmPick_Item_Single.adsPick.FieldValues['dept_name'];
        Label15.Caption:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
      } end;
      end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;



procedure Tfrm_detail.Edit4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  edit4.SelStart:=Length(edit4.Text);
end;


procedure Tfrm_detail.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#8,#13]) then             //判断是否输入空格
  begin
  //showmessage();
    showmessage('此处仅退格键有效');
    abort;
  end;
    Edit4.Text:=Stringremove_class(Edit4.Text,',',1);
    Edit6.Text:=Stringremove_class(Edit6.Text,',',1);
end;

procedure Tfrm_detail.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edit4.SelStart:=Length(edit4.Text);
end;


procedure Tfrm_detail.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edit4.SelStart:=Length(edit4.Text);
//Edit4.Text:=Stringremove_class(Edit4.Text,',',1);
//Stringremove(origanl_str,flag_str:string;step:integer):string;
end;


//按保存
procedure Tfrm_detail.BitBtn1Click(Sender: TObject);
begin
  if edit2.Text='' then
  begin
    showmessage('班组编码不能为空...');
    edit2.SetFocus;
    abort;
  end;
  if edit4.Text='' then
  begin
    showmessage('班次链不能为空...');
    edit4.SetFocus;
    abort;
  end;
  if Ftag = 0 then
  begin
    try
      dm.ADOTMP.SQL.Text := Format('select * from classgroup where classgroupcode = ''%s''', [edit2.Text]);
      dm.ADOTMP.Open;
      if not dm.ADOTMP.IsEmpty then
      begin
        showmessage(format('名称为''%s''的班组代码已经存在', [edit2.Text]));
        edit2.SetFocus;
        exit;
      end;
      dm.ADOTMP.Close;
      dm.ADOTMP.SQL.Text := '';
      dm.ADOTMP.SQL.Text := Format(' insert into classgroup'
        + '(ClassgroupCode,CalendarID,descript,StartDate,RepeatCycle,ClassBunch,Remark)'
        + ' select ''%s'',%d,''%s'',''%s'',%d,''%s'',''%s''',
        [edit2.Text, combobox1.Tag, edit3.Text, datetimetostr(datetimepicker1.DateTime), combobox2.ItemIndex, edit6.Text, richedit1.Text]);
      dm.ADOTMP.ExecSQL;
      dm.ADOTMP.Close;
      modalresult:=mrok;
    except on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
  if Ftag <> 0 then
  begin
    try
      dm.ADOTMP.SQL.Text:=Format('select * from classgroup where classgroupcode = ''%s'' and rkey <> %d ', [edit2.Text,Ftag]);
      dm.ADOTMP.Open;
      if not dm.ADOTMP.IsEmpty then
      begin
        showmessage(format('名称为''%s''的班组代码已经存在', [edit2.Text]));
        edit2.SetFocus;
        exit;
      end;
      dm.ADOTMP.Close;
      dm.ADOTMP.SQL.Text := '';
      dm.ADOTMP.SQL.Text := Format(' update classgroup '
        + 'set ClassgroupCode=''%s'',CalendarID=%d,descript=''%s'',StartDate=''%s'',RepeatCycle=%d,ClassBunch=''%s'',Remark=''%s'' '
        + 'from classgroup where rkey=%d ',
        [edit2.Text, combobox1.Tag, edit3.Text, datetimetostr(datetimepicker1.DateTime), combobox2.ItemIndex, edit6.Text, richedit1.Text,Ftag]);
      dm.ADOTMP.ExecSQL;
      dm.ADOTMP.Close;
      modalresult:=mrok;
    except on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure Tfrm_detail.Edit4Enter(Sender: TObject);
begin
  edit4.SelStart:=Length(edit4.Text);
end;

function Stringremove_class (origanl_str,flag_str:string;step_i:integer):string;
var
  i,j,k:Integer;
  new_str:string;
begin
  Result :=origanl_str;
  new_str:=origanl_str;
  k:=step_i;
  i :=1;
  j :=length(origanl_str);
  if AnsiContainsText(origanl_str,flag_str) then
    begin
      while ((i<j) and (k>0)) do
      begin
      if rightstr(new_str,1)=flag_str then
        begin
          new_str:=leftstr(new_str,(Length(new_str)-1));
          Result :=new_str;
          k:=k-1;
        end
      else
        begin
          new_str:=leftstr(new_str,(Length(new_str)-1));
          i:=i+1;
        end;
      end;
    end
  else
    begin
      Result :='';
    end;
end;

procedure Tfrm_detail.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', 'A'..'Z', 'a'..'z', #8])
  then    Key := #0;
end;
end.
