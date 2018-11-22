unit Frm_edit_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBCtrlsEh, ADODB, Mask, DBCtrls,
  Grids, DBGridEh, Menus;

type
  TMem = record
     rkey:integer;
    // FEdit:boolean;
     Mem :TMemoryStream;
  end;
  TFrm_edit = class(TForm)
    Panel1: TPanel;
    BtnClose: TBitBtn;
    BtnSave: TBitBtn;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBMemo4: TDBMemo;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Label1: TLabel;
    DBEdit4: TDBEdit;
    DS1: TDataSource;
    Label2: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    ComboBox1: TComboBox;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape19: TShape;
    Shape20: TShape;
    DS2: TDataSource;
    PopupMenu2: TPopupMenu;
    N7: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    Label13: TLabel;
    DBMemo1: TDBMemo;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label7: TLabel;
    DBMemo5: TDBMemo;
    Shape1: TShape;
    SGrid1: TStringGrid;
    N2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BtnSaveClick(Sender: TObject);
  private
    FTypekry:array[0..10] of integer;
    FB:boolean;
    procedure InitGrid;
  public
    Ftag :integer;
    Fmem :array[0..4] of  TMem;
    procedure init;
  end;



implementation
 uses DM_u,PubFunc,Frm_fileEdt_u,shellAPI,common;
{$R *.dfm}

{ TFrm_edit }

procedure TFrm_edit.init;
var i,j:integer;
begin
  if Ftag=0 then Caption:='项目输入' else Caption:='项目编辑' ;
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select * from FD306';
  DM.tmp.Open;
  i:=0;
  while not DM.tmp.Eof do
  begin
    ComboBox1.Items.Append(DM.tmp.Fields[1].asstring);
    FTypekry[i]:=DM.tmp.Fields[0].AsInteger;
    if DM.ADO307type_ptr.Value=DM.tmp.Fields[0].AsInteger then ComboBox1.ItemIndex:=i;
    inc(i);
    DM.tmp.Next;
  end;

  sgrid1.Cells[0,0]:='文件名称';
  sgrid1.Cells[1,0]:='版本';
  sgrid1.Cells[2,0]:='创建人';
  sgrid1.Cells[3,0]:='存档时间';
  sgrid1.Cells[4,0]:='存档人';
  sgrid1.Cells[5,0]:='结案';
  sgrid1.ColWidths[6]:=0;
  i:=1;
  DM.ADO308.First;
  FB:=true;
  while not DM.ADO308.Eof do
  begin
    for j:=0 to 6 do
    begin
      if j<>5 then
        sgrid1.Cells[j,i]:=DM.ADO308.Fields[j].AsString
      else begin
         if DM.ADO308.Fields[j].AsBoolean then  sgrid1.Cells[j,i]:='√' else  sgrid1.Cells[j,i]:='';
      end;
    end;
    DM.ADO308.Next;
    sgrid1.RowCount:=sgrid1.RowCount+1;
    inc(i);
  end;
  DM.ADO308.First;
  FB:=false;
  for i:=low(Fmem) to high(Fmem) do
  begin
    Fmem[i].rkey:=0;
    Fmem[i].Mem:=TMemoryStream.Create;
  end;
  InitGrid;
end;

procedure TFrm_edit.N1Click(Sender: TObject);
var i,j:integer;
    s:string;
    fs: TMemoryStream;
    N:boolean;
begin
  case TMenuItem(Sender).Tag of
  0:begin
      with TFrm_fileEdt.Create(nil) do
      try
        for j:=low(Fmem) to high(Fmem) do
          if Fmem[j].rkey=0 then begin M:=Fmem[j].Mem ;break;end;
        MemScript.MaxLength:=DBMemo1.MaxLength;
        if showmodal=mrok then
        begin
          dm.tmp.Close;
          dm.tmp.SQL.Text:='select getdate() ';
          dm.tmp.Open;
          i:=sgrid1.RowCount-1;
          sgrid1.Cells[0,i]:=EdtFName.text;
          sgrid1.Cells[1,i]:=EdtFVer.Text;
          sgrid1.Cells[2,i]:=EdtCrMan.Text;
          sgrid1.Cells[3,i]:=dm.tmp.Fields[0].AsString;
          sgrid1.Cells[5,i]:='';
          Fmem[j].rkey:=(random(1000)+142)*10000;
          sgrid1.Cells[6,i]:=inttostr(Fmem[j].rkey);

          DM.ADO308.Append;

          dm.ADO308doc_name.Value:=sgrid1.Cells[0,i];
          dm.ADO308doc_ver.Value:=strtoint(sgrid1.Cells[1,i]);
          dm.ADO308createMan.Value:=sgrid1.Cells[2,i];
          dm.ADO308saveDate.Value:=strtodatetime(sgrid1.Cells[3,i]);
          
          dm.ADO308saveMan.Value:=strtoint(user_ptr);
          dm.ADO308DocScript.Value:=MemScript.Text;
          DM.ADO308.Post;
          sgrid1.Cells[4,i]:=dm.ADO308employee_name.Value;
          sgrid1.RowCount:=sgrid1.RowCount+1;

        end;
      finally
        free;
      end;
    end;

  1:begin
      N:=false;
      with TFrm_fileEdt.Create(nil) do
      try
        for j:=low(Fmem) to high(Fmem) do
          if Fmem[j].rkey=strtoint(sgrid1.Cells[6,sgrid1.row]) then   //从 new add
          begin
            N:=true;
            M:=Fmem[j].Mem ;
            break;
          end;

        if not N then
        for j:=low(Fmem) to high(Fmem) do    //是old
          if Fmem[j].rkey=0 then
          begin
            M:=Fmem[j].Mem ;
            break;
          end;
        EdtFName.text:=sgrid1.Cells[0,sgrid1.row];
        EdtFVer.Text:=sgrid1.Cells[1,sgrid1.row];
        EdtCrMan.Text:=sgrid1.Cells[2,sgrid1.row];
        MemScript.MaxLength:=DBMemo1.MaxLength;
        MemScript.Text:=DBMemo1.Text;
        if showmodal=mrok then
        begin
          dm.tmp.Close;
          dm.tmp.SQL.Text:='select getdate() ';
          dm.tmp.Open;
          sgrid1.Cells[0,sgrid1.row]:=EdtFName.text;
          sgrid1.Cells[1,sgrid1.row]:=EdtFVer.Text;
          sgrid1.Cells[2,sgrid1.row]:=EdtCrMan.Text;
          sgrid1.Cells[3,sgrid1.row]:=dm.tmp.Fields[0].AsString;
          Fmem[j].rkey:=strtoint(sgrid1.Cells[6,sgrid1.row]);

          DM.ADO308.Edit;

          dm.ADO308doc_name.Value:=sgrid1.Cells[0,sgrid1.row];
          dm.ADO308doc_ver.Value:=strtoint(sgrid1.Cells[1,sgrid1.row]);
          dm.ADO308createMan.Value:=sgrid1.Cells[2,sgrid1.row];
          dm.ADO308saveDate.Value:=strtodatetime(sgrid1.Cells[3,sgrid1.row]);
          dm.ADO308saveMan.Value:=strtoint(user_ptr);
          dm.ADO308DocScript.Value:=MemScript.Text;
          DM.ADO308.Post;
          sgrid1.Cells[4,sgrid1.row]:=dm.ADO308employee_name.Value;

        end else
          Fmem[j].rkey:=0;
      finally
        free;
      end;
    end;

  2:begin
      if messagedlg('确认要删除该项记录吗？',mtconfirmation,[mbyes,mbNo],0)<>mrYes then exit;
      dm.ADO308.Delete;
      for j:=low(Fmem) to high(Fmem) do
      if Fmem[j].rkey=strtoint(sgrid1.Cells[6,sgrid1.Row]) then
      begin
        Fmem[j].rkey:=0;
        Fmem[j].Mem.Clear ;
        break;
      end;

      for i:=sgrid1.Row to sgrid1.Rowcount-2 do
      begin
        sgrid1.rows[i].Text :=sgrid1.rows[i+1].Text ;
      end;
      sgrid1.Rowcount:=sgrid1.Rowcount-1;
    end;

  4:begin
      if not DirectoryExists(TmpFileDir) then
        if not CreateDir(TmpFileDir) then  raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
      for j:=low(Fmem) to high(Fmem) do
      if Fmem[j].rkey=strtoint(sgrid1.Cells[6,sgrid1.Row]) then
      begin
        if Fmem[j].Mem.Size=0 then
        begin
          showmessage('此文档为空...');
          exit;
        end;
        s:=TmpFileDir+sgrid1.Cells[0,sgrid1.Row];
        Fmem[j].Mem.SaveToFile(s);
        ShellExecute(self.Handle,nil,pchar(s),nil,nil,SW_SHOWNORMAL);
        exit;
      end;

      DM.ADOImg.Close;
      DM.ADOImg.SQL.Text:='select DocContent from FD308 where rkey='+sgrid1.Cells[6,sgrid1.Row];
      DM.ADOImg.Open;
      if dm.ADOImg.Fields[0].IsNull then
      begin
        showmessage('此文档为空...');
        exit;
      end;
      fs := TMemoryStream.Create;
      TBlobField(dm.ADOImg.Fields[0]).SaveToStream(fs);
      UnPackStream(fs);
      s:=TmpFileDir+sgrid1.Cells[0,sgrid1.Row];
      fs.SaveToFile(s);
      fs.Free;
      ShellExecute(self.Handle,nil,pchar(s),nil,nil,SW_SHOWNORMAL);
    end;
  end;
end;

procedure TFrm_edit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=13) and not (self.ActiveControl is TDBMemo) then
    self.SelectNext(self.ActiveControl,true,true);
end;

procedure TFrm_edit.PopupMenu2Popup(Sender: TObject);
begin
  N2.Enabled:=not dm.ADO308.IsEmpty and not dm.ADO308status.AsBoolean;
  N3.Enabled:=N2.Enabled;
end;

procedure TFrm_edit.InitGrid;
begin
  DBMemo1.ReadOnly:=false;
  DBMemo1.MaxLength:=DBMemo1.Field.Size;
  DBMemo2.MaxLength:=DBMemo2.Field.Size;
  DBMemo3.MaxLength:=DBMemo3.Field.Size;
  DBMemo4.MaxLength:=DBMemo4.Field.Size;
  DBMemo5.MaxLength:=DBMemo5.Field.Size;
end;

procedure TFrm_edit.ComboBox1Change(Sender: TObject);
begin
  DM.ADO307type_ptr.Value:=FTypekry[ComboBox1.ItemIndex];
end;

procedure TFrm_edit.FormDestroy(Sender: TObject);
var i:integer;
begin
  for i:=low(Fmem) to high(Fmem) do
  begin
    Fmem[i].rkey:=0;
    Fmem[i].Mem:=TMemoryStream.Create;
  end;
end;

procedure TFrm_edit.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
   CanSelect:=(ARow<>SGrid1.RowCount-1) and (ARow<>0) ;
  if not (FB or (ARow=SGrid1.RowCount-1) or (ARow=0)) then
    DM.ADO308.Locate('doc_name;doc_ver',vararrayof([SGrid1.Cells[0,ARow],strtoint(SGrid1.Cells[1,ARow])]),[]);
end;

procedure TFrm_edit.BtnSaveClick(Sender: TObject);
begin
  if DM.ADO307PrgID.Value='' then
  begin
    showmessage('项目编号不能为空...');
    abort;
  end;
  if DM.ADO307PrgName.Value='' then
  begin
    showmessage('项目名称不能为空...');
    abort;
  end;
  if DM.ADO307Responsor.Value='' then
  begin
    showmessage('项目负责人不能为空...');
    abort;
  end;
  if DM.ADO307Startdate.AsString='' then
  begin
    showmessage('立项时间不能为空...');
    abort;
  end;
  if DM.ADO307type_ptr.AsString='' then
  begin
    showmessage('项目类别不能为空...');
    abort;
  end;
  ModalResult:=mrok;
end;

end.
