--���ܣ����Ĵ���
--NPC�����Ĵ���ʹ��

--**********************************

--������ں���

--**********************************

function x800021_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

end

--�û�ͨ��UI�����л�����
--��CGMapInfoHandler�б�����
function x800021_OnChangeSceneEvent(sceneId, selfId, index)	
				
	--�õ�����ó�����Ҫ����С�ȼ�������ID��λ����Ϣ
	local MinUserLevel, targetSceneId, PosX,PosZ = LuaFnGetNewSceneInfoByIndex(sceneId,index)
	
	local level = GetLevel(sceneId, selfId)
	
	if level >= MinUserLevel then
		if LuaFnIsInStall(sceneId, selfId) == 0 then
			if (sceneId~=targetSceneId) then
				NewWorld(sceneId,selfId,targetSceneId,PosX,PosZ)	
			else
				BeginEvent(sceneId)
					strText = "#Y���Ѿ����˵���"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
		end
	else
		BeginEvent(sceneId)
			strText = "#Y��ȼ����ͣ��޷�ǰ��Ŀ�ĵ�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
	
end

--**********************************

--�о��¼�

--**********************************

function x800021_OnEnumerate(sceneId, selfId, targetId)

end



--**********************************

--����������

--**********************************

function x800021_CheckAccept(sceneId, selfId, targetId)

end

--**********************************

--����

--**********************************

function x800021_OnAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--����

--**********************************

function x800021_OnAbandon(sceneId, selfId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x800021_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--�ύ

--**********************************

function x800021_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	
end



--**********************************

--ɱ����������

--**********************************

function x800021_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x800021_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x800021_OnItemChanged(sceneId, selfId, itemdataId)

end