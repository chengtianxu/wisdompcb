unit return_nopo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Mask, DBCtrls;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    ado95: TADOQuery;
    ado2211: TADOStoredProc;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    BitBtn4: TBitBtn;
    rkey76: TLabel;
    ADO96: TADOQuery;
    ADO96RKEY: TAutoIncField;
    ADO96INVT_PTR: TIntegerField;
    ADO96REJ_PTR: TIntegerField;
    ADO96INV_TRAN_PTR: TIntegerField;
    ADO96EMPL_PTR: TIntegerField;
    ADO96USER_PTR: TIntegerField;
    ADO96TDATE: TDateTimeField;
    ADO96QUAN_REJD: TFloatField;
    ADO96FLAG: TStringField;
    ADO96REFERENCE_NUMBER: TStringField;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  requ_note: tstringlist;
implementation
 uses main, note, mater_rej_search;
{$R *.dfm}

procedure TForm2.Edit2Exit(Sender: TObject);
begin
 if trim(edit2.Text)='' then  edit2.Text := '0';
 if (strtofloat(edit2.Text)>strtofloat(edit1.Text)) and (activecontrol.Name<>'BitBtn3') then
  begin
   messagedlg('退还的数量不能大于可用的数量!',mterror,[mbcancel],0);
   edit2.SetFocus;
  end
 else
  edit2.Text := formatfloat('0.000',strtofloat(edit2.Text));
end;

procedure TForm2.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if (key = chr(46)) then
 if pos('.',edit2.Text)>0 //小数点不能重复
  then abort;
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 ado95.Open;
 requ_note:=tstringlist.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
 requ_note.Free;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:byte;
begin
 with ado2211 do
  begin
   close;
   ado2211.Parameters[2].Value := form1.ADOQuery1.FieldValues['rkey'];
   open;
   if not isempty then
    for i:=1 to 4 do
     requ_note.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
  end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Memo1.Lines.Assign(requ_note);
 if edit_note.ShowModal=mrok then
   requ_note.Text:=edit_note.Memo1.Text;
 finally
  edit_note.free;
 end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:byte;
begin
 if strtofloat(edit2.Text)=0 then
  begin
   messagedlg('退货数量为零!',mtinformation,[mbok],0);
   edit2.SetFocus;
   exit;
  end;
 if trim(edit3.Text)='' then
  begin
   messagedlg('拒收代码不能为空!',mtinformation,[mbok],0);
   edit3.SetFocus;
   exit;
  end;
//==============================================================================
 if (not ADO2211.IsEmpty) and (trim(requ_note.Text)<>'') then
  begin //原记录有记事本
   ADO2211.Edit;
   for i:=1 to 4 do
    IF requ_note.Count>=i then
     ADO2211.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=requ_note.Strings[i-1]
    else
     ADO2211.fieldbyname('note_pad_line_'+inttostr(i)).asstring:='';
    ADO2211.Post;
  end
 else
  if (not ADO2211.IsEmpty) and (trim(requ_note.Text)='') then
   ADO2211.Delete   //如果原记录有记事本但被删除了
  else
   if (ADO2211.IsEmpty) and (trim(requ_note.Text)<>'') then
    begin           //如果原记录没有记事本，但新增了记事本
     ADO2211.Append;
     ADO2211.FieldByName('file_pointer').AsString:=form1.ADOQuery1.fieldbyname('rkey').AsString;
     ADO2211.Fieldvalues['source_type']:=22;
     for i:=1 to requ_note.Count do
      ADO2211.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=requ_note.Strings[i-1];
      ADO2211.Post;
    end;
//==============================================================================
 with ado95 do
  begin
   append;
   fieldvalues['tran_tp'] :=19;
   fieldvalues['invt_ptr'] :=form1.ADOQuery1.FieldValues['inventory_ptr'];
   fieldvalues['srce_ptr'] :=form1.ADOQuery1.FieldValues['rkey'];
   fieldbyname('user_ptr').AsString:=form1.csi_rkey.caption;
   fieldbyname('quantity').AsString:=edit2.Text;
   FieldValues['tran_by'] := form1.empl_ptr;
   Fieldvalues['tran_date'] := form1.sys_longdate;
   post;
  end;
//==============================================================================
 ado96.Open;
 ado96.Append;
 self.ADO96INVT_PTR.Value:=form1.ADOQuery1inventory_ptr.Value;
 self.ADO96REJ_PTR.Value:=strtoint(rkey76.Caption);
 self.ADO96INV_TRAN_PTR.Value:=form1.ADOQuery1rkey.Value;
 self.ADO96USER_PTR.Value:=strtoint(form1.csi_rkey.Caption);
 self.ADO96EMPL_PTR.Value:=form1.empl_ptr;
 self.ADO96TDATE.Value:=form1.sys_longdate;
 self.ADO96QUAN_REJD.Value:=strtofloat(edit2.Text);
 self.ADO96FLAG.Value:='2';
 self.ADO96REFERENCE_NUMBER.Value:=form1.ADOQuery1BARCODE_ID.Value;
 ado96.post;
//==============================================================================
 ModalResult:=mrok;
end;

procedure TForm2.Edit3Click(Sender: TObject);
begin
 IF edit3.Font.Color = clwindowtext then
  begin
   edit3.Font.Color := clblue;
   edit3.SelectAll;
  end;
end;

procedure TForm2.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'Bitbtn3')
   and (trim(edit3.Text)<>'') then
 try
  form_marej := tform_marej.Create(application);
  form_marej.Edit1.Text := trim(edit3.Text);
 if comparetext(trim(edit3.text),trim(form_marej.ADOQuery1.fieldbyname('code').AsString))=0 then
  begin
   edit3.Font.Color := clwindowtext;
   label4.Caption := form_marej.ADOQuery1.fieldbyname('reject_description').AsString;
   rkey76.Caption := form_marej.ADOQuery1.fieldbyname('rkey').AsString;
  end
 else
  begin
   messagedlg('拒收代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label4.Caption := '';
   edit3.SetFocus;
  end;
 finally
  form_marej.Free;
 end;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
 try
  form_marej := tform_marej.Create(application);
  form_marej.Edit1.Text := trim(edit3.Text);
  if form_marej.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
    edit3.SetFocus;
   end
  else
  if form_marej.ShowModal = mrok then
   begin
    edit3.Text := form_marej.ADOQuery1.fieldbyname('code').AsString;
    edit3.Font.Color := clwindowtext;
    label4.Caption := form_marej.ADOQuery1.fieldbyname('reject_description').AsString;
    rkey76.Caption := form_marej.ADOQuery1.fieldbyname('rkey').AsString;
   end;
 finally
  form_marej.free;
 end;
end;

end.
