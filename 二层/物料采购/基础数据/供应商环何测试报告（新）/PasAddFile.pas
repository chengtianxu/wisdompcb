unit PasAddFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,DB, ExtCtrls;

type
  TfrmAddFile = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    cbxFileType: TComboBox;
    Label2: TLabel;
    edtFileName: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cbxFileTypeChange(Sender: TObject);
  private
    fileName:string;
    fileType:Integer;
    { Private declarations }
  public
    rkey805:Integer;
    { Public declarations }
  end;

var
  frmAddFile: TfrmAddFile;

implementation

uses DAMO;

{$R *.dfm}

procedure TfrmAddFile.BitBtn1Click(Sender: TObject);
var
  openFile:TOpenDialog;
begin
  try
    openFile:=TOpenDialog.Create(Application);
    if openFile.Execute then
    begin
      fileName:=openFile.FileName;
      edtFileName.Text:=ExtractFileName(fileName);  //取得文件名函数
    end;
  finally
    openFile.Free;
  end;
end;

procedure TfrmAddFile.btnSaveClick(Sender: TObject);
var
  fs:TFileStream;
begin
  if cbxFileType.Text='' then
  begin
    ShowMessage('文件类型不能为空');
    Exit;
  end;
  if trim(edtFileName.Text)='' then
  begin
    showmessage('请先选择要添加的文件');
    exit;
  end;
  fs:=TFileStream.Create(fileName,fmOpenRead);
  if fs.Size >10*1024*1024 then
  begin
    ShowMessage('文件大小不能超过10M，请处理后重新上传');
    Exit;
  end;
  try
    with DM.adoTime do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey, D805_ptr, FileType, FileName, VCUT_BMP, Remarks from data0806 where D805_ptr='+ IntToStr(rkey805)+ ' and filetype='+ IntToStr(fileType);
      Open;
      if not IsEmpty then
      begin
        if MessageDlg('已经存在此类型文件，是否覆盖？',mtConfirmation,[mbYes,mbNo],0)=mryes then
        begin
          with DM.adoTmp do
          begin
            Close;
            SQL.Clear;
            SQL.Text:='select rkey, D805_ptr, FileType, FileName, VCUT_BMP, Remarks from data0806 where D805_ptr='+ IntToStr(rkey805)+ ' and filetype='+ IntToStr(fileType);
            Open;
            Edit;
            TBlobfield(FieldByName('VCUT_BMP')).LoadFromStream(fs);
            FieldByName('FileName').Value:=Trim(edtFileName.Text);
            FieldByName('remarks').Value:=Memo1.Lines.Text;
            Post;
            UpdateBatch();
          end;
        end;
      end
      else
      begin
        with DM.adoTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='select rkey, D805_ptr, FileType, FileName, VCUT_BMP, Remarks from data0806 where rkey = 0';
          Open;
          Insert;
          TBlobfield(FieldByName('VCUT_BMP')).LoadFromStream(fs);
          FieldByName('D805_ptr').Value:= rkey805;
          FieldByName('FileType').Value:= fileType;
          FieldByName('FileName').Value:=Trim(edtFileName.Text);
          FieldByName('remarks').Value:=Memo1.Lines.Text;
          Post;
          UpdateBatch();
        end;
      end;
    end;
    fs.Free;
    ModalResult:=mrYes;
  except
    on E: Exception do
    begin
      fs.Free;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TfrmAddFile.cbxFileTypeChange(Sender: TObject);
begin
  case cbxFileType.ItemIndex of
    0: fileType:=1;
    1: fileType:=2;
    2: fileType:=3;
    3: fileType:=4;
  end;
end;

end.
