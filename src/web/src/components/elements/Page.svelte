<script lang="ts">
	import { fade } from "svelte/transition";
	import { pageStore } from "../../store/stores";
	import { useNuiEvent } from "../../utils/useNuiEvent";

	export let id: string;
	export let isVisible: boolean = false;
	export let transition = fade;

	$: isVisible = $pageStore == id;

	useNuiEvent<string>("setPage", (page) => {
		$pageStore = page;
	});
</script>

{#if isVisible}
	<section class="fixed left-0 top-0 h-screen w-full" transition:transition={{ duration: 150 }}>
		<div class="relative h-full">
			<slot />
		</div>
	</section>
{/if}
