--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

x211022_g_ScriptId = 211022
x211022_g_MissionName="������"
--**********************************

--������ں���

--**********************************

function x211022_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	CallScriptFunction((800019), "TransferFunc",sceneId, selfId, 1,86,130)
end

--�û�ͨ��UI�����л�����
--��CGMapInfoHandler�б�����
function x211022_OnChangeSceneEvent(sceneId, selfId, index)	
				
	--�õ�����ó�����Ҫ����С�ȼ�������ID��λ����Ϣ
	local MinUserLevel, targetSceneId, PosX,PosZ = LuaFnGetNewSceneInfoByIndex(sceneId,index)
	
	local level = GetLevel(sceneId, selfId)
	
	if level >= MinUserLevel then
		if LuaFnIsInStall(sceneId, selfId) == 0 then
			NewWorld(sceneId,selfId,targetSceneId,PosX,PosZ)	
		end
	end

end

--**********************************

--�о��¼�

--**********************************

function x211022_OnEnumerate(sceneId, selfId, targetId)
		AddNumText(sceneId, x211022_g_ScriptId, x211022_g_MissionName)
end



--**********************************

--����������

--**********************************

function x211022_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x211022_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x211022_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x211022_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x211022_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x211022_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x211022_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x211022_OnItemChanged(sceneId, selfId, itemdataId)

end